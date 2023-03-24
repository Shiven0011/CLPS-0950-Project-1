% By Shiven Sasipalli
% Time spent on this section: 2 hrs

cipher = input('What cipher would you like us to decode? The input \n');


text_cap = input('What is it that needs to be decrypted? \n');


%function [decrypted] = decryption(cipher, text_cap)

%[message] = function conversion(text_cap)
text_cap = upper(text);
Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
Map(Alphabet(1:26)) = 1:26;
Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
Map(Alphabet(1:27)) = 1:27;
message = map(text_cap);

%if cipher == 'Vignere'

%end

%if cipher == 'Ceaser'

%end

if cipher == "Hill"
    %Take keyword and convert into a 2x2 matrix of numbers
    key_letter = input("What is the 4 letter keyword? \n")
    conversion(key_letter);
    key = reshape(message, 2, 2);

    %Now find the determinant of the keyword
    inv_mat = inv(key);
    diag1 = diag(inv_key);
    diag1_sum = sum(diag1);
    determinant = diag1_sum - (inv_key(1,2)+inv_key(2,2));
    inv_key = determinant * inv_mat;

    %Now use determinant to find cipher
    for i = 1:2:length(text_cap)
        decry = [message(i); message(i+1)];
        decode_num = decry * inv_key;
        decrypted_num(i) = [decode_num(i)'];
        decrypted_num(i+1) = [decode_num(i+1)'];
    end
    decrypted = map(decrypted_num);
    disp(decrypted);
        




end
%end
%end