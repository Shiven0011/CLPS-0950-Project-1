function [encoded] = caesar_encoder(text)
%CAESAR_ENCODER shifts the entire message by the same scalar amount. 
%   written on 3/16, last modified 3/17 
%   by Sid Udata
%   let2num function
text_cap = upper(text);
Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
Map(Alphabet(1:27)) = 1:27;
message = Map(text_cap);
%   'message' is a vector generated from the letters in 'text'.

shift = randi([1,26], 1, 1);
%   'shift' is a random scalar that is used to shift the caesar cypher.

encoded = message + shift;

for ii = 1:length(message)
    if encoded(ii) >27
        encoded(ii) = encoded(ii) - 27;
    end
end

disp(message);
disp(encoded);

end

