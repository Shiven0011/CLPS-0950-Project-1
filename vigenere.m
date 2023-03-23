letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
keyword = input("Please enter the keyword: ","S");

size_key = size(keyword);
s1 = size_key(2);

message = input("Please enter a message to encrypt: ", "S");
size_mess = size(message);
s2 = size_mess(2);

if s2 <= s1
    v = 1:s2;
    keyword=[keyword(v)];
elseif (s1<s2) && (s2<2*s1)
    s3 = s2-s1;
    v=1:s3;
    keyword=[[keyword], [keyword(v)]];
else s2>2*s1
    s3 = s2-2*s1;
    v=1:s3;
    k=[[keyword], [keyword], [keyword(v)]];
end

for 1=1:s2
    vec
