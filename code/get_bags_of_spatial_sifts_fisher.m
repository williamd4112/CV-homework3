% Starter code prepared by James Hays

%This feature representation is described in the handout, lecture
%materials, and Szeliski chapter 14.

function image_feats = get_bags_of_spatial_sifts_fisher(image_paths, endcode_size)

    load('vocab_sift_fisher.mat');

    N = size(image_paths, 1);
    L = 3;
    image_feats = zeros(N, sum(4.^(0:L-1).*endcode_size));

    for id=1:N
        if mod(id, 10) == 0
            display(id);
        end
        im = im2single(imread(image_paths{id}));
        [locations, SIFT_features] = vl_dsift(im,'Step',5);
        image_feats(id,:) = get_spatial_sifts_fisher(SIFT_features, locations, L, size(im), vocab_sift_fisher, endcode_size);
    end
end

function image_feat = get_spatial_sifts_fisher(SIFT_features, locations, L, im_size, vocab, endcode_size)
    image_feat = zeros(1, sum(4.^(0:L-1).*endcode_size));
    for level = 0:L-1
        n = 2^(level);
        region_size = ceil(im_size / n);
        [ind_i, ind_j] = meshgrid(1:n, 1:n); 
        inds = [ind_i(:) ind_j(:)];
        
        ind_begin = 4^(level - 1).*endcode_size;
        if level == 0
            ind_begin = 1;
            ind_end = n * n * endcode_size;
        else
            ind_end = (ind_begin - 1) + n * n * endcode_size;
        end
        
        feat = zeros(n * n, endcode_size);
        for id = 1:size(inds, 1)
            ind = inds(id, :);
            location = (locations(1,:) > (ind(1) - 1) * region_size(1) & locations(1,:) <= (ind(1)) * region_size(1) &  locations(2,:) > (ind(2) - 1) * region_size(2) & locations(2,:) <= (ind(2)) * region_size(2));
            feat(id,:) = vl_fisher(single(SIFT_features(:,location)), single(vocab{1}), single(vocab{2}), single(vocab{3}));
        end
        image_feat(1, ind_begin:ind_end) = reshape(feat, 1, n * n * endcode_size);
    end
end




