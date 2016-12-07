% Starter code prepared by James Hays

%This function will train a linear SVM for every category (i.e. one vs all)
%and then use the learned linear classifiers to predict the category of
%every test image. Every test feature will be evaluated with all 15 SVMs
%and the most confident SVM will "win". Confidence, or distance from the
%margin, is W*X + B where '*' is the inner product or dot product and W and
%B are the learned hyperplane parameters.

function predicted_categories = svm_kernel_rbf_classify(train_image_feats, train_labels, test_image_feats)

    categories = unique(train_labels); 
    num_categories = length(categories);
    num_train = size(train_image_feats,1);
    num_test = size(test_image_feats,1);

    labels = zeros(num_train,1);
    for i=1:num_categories,
        labels(strcmp(train_labels,categories(i))) = i;
    end    

    perm = randperm(num_train);
    train_image_feats = train_image_feats(perm,:);
    labels = labels(perm);

    model = svmtrain(labels, train_image_feats, '-t 0 -e 1e-5 -c 0.1 -g 0.00312');
    predictions = svmpredict(randi([1,num_categories],num_test,1),test_image_feats,model);
    predicted_categories = cell(num_test,1);
    for i=1:num_test,
        predicted_categories{i} = categories{predictions(i)};
    end
end



