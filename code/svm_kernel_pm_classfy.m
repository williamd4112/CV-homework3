% Starter code prepared by James Hays

%This function will train a linear SVM for every category (i.e. one vs all)
%and then use the learned linear classifiers to predict the category of
%every test image. Every test feature will be evaluated with all 15 SVMs
%and the most confident SVM will "win". Confidence, or distance from the
%margin, is W*X + B where '*' is the inner product or dot product and W and
%B are the learned hyperplane parameters.

function predicted_categories = svm_kernel_pm_classfy(train_image_feats, train_labels, test_image_feats)

% categories = unique(train_labels); 
% num_categories = length(categories);
% num_train = size(train_image_feats, 1);
% num_test = size(test_image_feats, 1);
% dim = size(test_image_feats, 2);
% Ws = zeros(num_categories, dim);
% Bs = zeros(num_categories, 1);
% LAMBDA = 0.00002;
% for ii=1:num_categories
%     labels = ones(num_train,1).*-1;
%     labels(strcmp(categories{ii}, train_labels)) = 1;
%     [W, B] = vl_svmtrain(train_image_feats', labels, LAMBDA, 'MaxNumIterations', 1e5);
%     Ws(ii,:) = W';
%     Bs(ii) = B;
% end
% 
% confidences = Ws*test_image_feats'+repmat(Bs,1,num_test);
% [~, indices] = max(confidences);
% predicted_categories = categories(indices);


%# split into train/test datasets
% trainData = data(1:150,:);
% testData = data(151:270,:);
% trainClass = dataClass(1:150,:);
% testClass = dataClass(151:270,:);
categories = unique(train_labels); 
num_categories = length(categories);
num_train = size(train_image_feats, 1);
num_test = size(test_image_feats, 1);

labels = zeros(num_train,1);
for i=1:num_categories,
    labels(strcmp(train_labels,categories(i))) = i;
end 

%# compute kernel matrices between every pairs of (train,train) and
%# (test,train) instances and include sample serial number as first column
K =  [ (1:num_train)' , pm_kernel(train_image_feats,train_image_feats) ];
KK = [ (1:num_test)'  , pm_kernel(test_image_feats,train_image_feats)  ];

%# train and test
model = svmtrain((1:num_train), K, '-t 4 -e 1e-5 -c 0.01');
pred = svmpredict((1:num_categories), KK, model);
predicted_categories = cell(num_test,1);
display(pred);
for i=1:num_test
    pred(i)
    display(size(predicted_categories))
    predicted_categories{i} = categories{pred(i)};
end
end

function kernel_value = pm_kernel(Xs, Ys)
    kernel_value = zeros(size(Xs, 1), size(Ys, 1));
    for ind_i = 1:size(Xs, 1)
        for ind_j = 1:size(Ys, 1)
           kernel_value(ind_i,ind_j) = sum(min(Xs(ind_i,:), Ys(ind_j,:)));
        end
    end
end



