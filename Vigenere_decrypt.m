letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
keyword = input("Please enter the keyword: ","S");

keySize1 = size(keyword);
keySize = keySize1(2);

message = input("Please enter an encrypted message to decrypt: ", "S")

messageSize1 = size(message);
messageSize = messageSize1(2);

if (messageSisze <= keySize) && (MessageSize*2 > keySize)
    v = 1:messageSize;
    keyword = [keyword(v)];
    disp("1111111");

elseif (keySize < messageSize) && (messageSize <= 2*keySize)
    s3 = messageSize - keySize;
    v=1:s3;
    keyword = [keyword, keyword(v)];
    disp("222222");

elseif messageSize > 2*keySize
    s3 = messageSize - 2*keySize;
    v = 1:s3;
    keyword = [keyword, keyword, keyword(v)];
    disp('333333');
end

for i=1:messageSize
    messageNumpos(i) = find(letters == (message(i)))-1;
    keyNumpos(i) = find(letters == (keyword(i)))-1;
end
numShift = messageNumpos - keyNumpos + 1;

for i=1:messageSize
    if numShift(i) < 0
        numShift(i) = mod(numShift(i), 26);
    elseif numShift(i) == 0
        numShift(i) = 26;
    end
end

for i = 1:messageSize
    decFinal(i) = letters(numShift(i));
end

disp(["DECRYPTED MESSAGE: ", num2str(decFinal)])
