letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
keyword = input("Please enter the keyword: ","S");

size_key = size(keyword);
s1 = size_key(2);

message = input("Please enter a message to encrypt: ", "S");
message = message(find(~isspace(message)));
size_mess = size(message);
s2 = size_mess(2);

if s2 <= s1
    v = 1:s2;
    keyword=[keyword(v)];
elseif (s1<s2) && (s2<2*s1)
    s3 = s2-s1;
    v=1:s3;
    keyword=[keyword, [keyword(v)]];
else s2 > 2*s1;
    s3 = s2-2*s1;
    v=1:s3;
    keyword=[keyword, keyword, [keyword(v)]];
end

for i=1:s2
    letter2numMessage(i) = find(letters==(message(i)))-1;
    letter2numKeyword(i) = find(letters==(keyword(i)))-1;
end
numbersShiftedvec = letter2numKeyword + letter2numMessage + 1;

for i=1:s2
    if numbersShiftedvec(i) > 26
        numbersShiftedvec(i) = mod(numbersShiftedvec(i), 26);
    end
end

for i=1:s2
    encMess(i) = letters(numbersShiftedvec(i));
end

disp(['ENCRYPTED MESSAGE: ', num2str(encMess)])
    
