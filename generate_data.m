function [data_matrix, nameDs] = generate_data()
    filename = strcat('Datasets/s1.txt');
    cprintf('key', '\nTesting in %s Dataset. \nEdit dataset name in function generate_data (s1-s15.txt)', filename); 
    data_matrix_with_label = importdata(filename);
    data_matrix = data_matrix_with_label(:,1:end);
    nameDs = filename(end-5:end-4);
    if nameDs(1) == '1'
        nameDs = filename(end-6:end-4);
    end
end
