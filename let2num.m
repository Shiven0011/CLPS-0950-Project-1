function [message] = let2num(text)
% LET2NUM converts a alphabetic message into a line vector.
%   A = 1, B = 2, ..., Z = 26. It only works for CAPITAL LETTERS!
%   written on 3/15
%   by Sid Udata
Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
Map(Alphabet(1:26)) = 1:26;
message = Map(text);
end

