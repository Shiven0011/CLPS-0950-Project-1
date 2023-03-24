%Creating an alphabet vector which will be related to the position of the
%letters (1-26). Only uppercase inputs will work for both inputs!

letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
keyword = input("Please enter the keyword: ","S");

%Measuring the size of the keyword (number of letters)
size_key = size(keyword);
s1 = size_key(2);

message = input("Please enter a message to encrypt: ", "S");
message = message(find(~isspace(message))); %Spaces/white space were an issue! This line actually removes any spaces.

%Measuring the size of the inputted message (number of letters)
size_mess = size(message);
s2 = size_mess(2);

if s2 <= s1 
    v = 1:s2;
    keyword=[keyword(v)];
%This first if statement considers the possibility that the keyword is
%longer than the actual message itself!
elseif (s1<s2) && (s2<2*s1)
    s3 = s2-s1;
    v=1:s3;
    keyword=[keyword, [keyword(v)]];
%This second elseif statement considers the possibility that the message length is
%inbetween the size of the keyword and twice the size of the keyword!
else s2 > 2*s1;
    s3 = s2-2*s1;
    v=1:s3;
    keyword=[keyword, keyword, [keyword(v)]];
%This third elseif statement considers the possibility that the message is
%longer than twice the size of the keyword!
end

%This for loop will convert every letter of the keyword and the message to
%its numerical equivalent between 1 and 26. 
for i=1:s2
    letter2numMessage(i) = find(letters==(message(i)))-1;
    letter2numKeyword(i) = find(letters==(keyword(i)))-1;
end
numbersShiftedvec = letter2numKeyword + letter2numMessage + 1; %The resultant vector after applying the shift!

%This for loop accounts for cases where the resultant numerical value is
%greater than 26, which is out of the scope of the alphabet.
for i=1:s2
    if numbersShiftedvec(i) > 26
        numbersShiftedvec(i) = mod(numbersShiftedvec(i), 26);
    end
end

%Converting the final numbers back to letters for display of the encrypted
%message!
for i=1:s2
    encMess(i) = letters(numbersShiftedvec(i));
end

disp(['ENCRYPTED MESSAGE: ', num2str(encMess)])
    
