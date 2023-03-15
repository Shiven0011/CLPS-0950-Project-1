function [encoded] = caesar_encoder(text)
%CAESAR_ENCODER shifts the entire message by the same scalar amount. 
%testing if push works

%   let2num function
Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
Map(Alphabet(1:26)) = 1:26;
message = Map(text);
%   'message' is a vector generated from the letters in 'text'.

shift = randi([1,26], 1, 1);
%   'shift' is a random scalar that is used to shift the caesar cypher.

encoded = message + shift;

for ii = 1:length(message)
    if encoded(ii) >26
        encoded(ii) = encoded(ii) - 26;
    end
end

disp(encoded);

end

