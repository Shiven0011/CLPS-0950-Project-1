function [decoded] = caesar_decoder(encoded)
%CAESAR_DECODER decodes the output of CAESAR_ENCODER
%   A caesar cypher shifts the message by the same scalar amount.
%   written on 3/18, last modified 3/23
%   by Sid Udata

Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
Map(1:27) = Alphabet(1:27);

for ii = 1:27
    output = encoded + ii;
    for jj = 1:length(output)
        if output(jj) >27
        output(jj) = output(jj) - 27;
        end
    end
    decoded = Map(output);
    disp(decoded);
end

end
