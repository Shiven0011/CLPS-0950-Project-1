function [message] = let2num(text)
% LET2NUM converts a alphabetic message into a line vector.
%   A = 1, B = 2, ..., Z = 26.
%   written on 3/15
%   by Sid Udata
text_cap = upper(text);
Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
Map(Alphabet(1:27)) = 1:27;
message = Map(text_cap);
end