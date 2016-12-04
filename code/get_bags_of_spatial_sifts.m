% Starter code prepared by James Hays

%This feature representation is described in the handout, lecture
%materials, and Szeliski chapter 14.

function image_feats = get_bags_of_spatial_sifts(image_paths)

    load('vocab.mat');

    vocab_size = size(vocab, 1);
    N = size(image_paths, 1);
    L = 3;
    image_feats = zeros(N, sum(4.^(0:L-1).*vocab_size));

    for id=1:N
        if mod(id, 10) == 0
            display(id);
        end
        im = im2single(imread(image_paths{id}));
        [locations, SIFT_features] = vl_dsift(im,'Step',5);
        image_feats(id,:) = get_spatial_sifts(SIFT_features, locations, L, size(im), vocab);
        %[indices, ~] = knnsearch(vocab, single(SIFT_features)', 'K', 1);
        %image_feats(id,:) = histc(indices, 1:vocab_size)';
    end
end

function image_feat = get_spatial_sifts(SIFT_features, locations, L, im_size, vocab)
    vocab_size = size(vocab, 1);
    image_feat = zeros(1, sum(4.^(0:L-1).*vocab_size));
    for level = 0:L-1
        n = 2^(level);
        region_size = ceil(im_size / n);
        [ind_i, ind_j] = meshgrid(1:n, 1:n); 
        inds = [ind_i(:) ind_j(:)];
        
        ind_begin = 4^(level - 1).*vocab_size;
        if level == 0
            ind_begin = 1;
            ind_end = n * n * vocab_size;
        else
            ind_end = (ind_begin - 1) + n * n * vocab_size;
        end
        
        feat = zeros(n * n, vocab_size);
        for id = 1:size(inds, 1)
            ind = inds(id, :);
            location = (locations(1,:) > (ind(1) - 1) * region_size(1) & locations(1,:) <= (ind(1)) * region_size(1) &  locations(2,:) > (ind(2) - 1) * region_size(2) & locations(2,:) <= (ind(2)) * region_size(2));
            [indices, ~] = knnsearch(vocab, single(SIFT_features(:,location))', 'K', 1);
            feat(id,:) = histc(indices, 1:vocab_size)';
        end
        image_feat(1, ind_begin:ind_end) = reshape(feat, 1, n * n * vocab_size);
    end
end




