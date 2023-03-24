% Cyphers Project 1
% CLPS 0950, Brown University, Spring 2023
% Sid Udata, Shiven Sassipalli, Shrey Mehta

prompt_E_or_D = ['Would you like to ENCODE or DECODE a message?' ...
    '(0=encode, 1=decode): '];
e_or_d = input(prompt_E_or_D);

% ENCODING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if e_or_d == 0

    prompt_type = 'What type of cypher do you want to ENCODE with? (2=Caesar, 3=Vigenere, 4=Hill):';
    type_encoder = input(prompt_type);

    % CAESAR ENCODER
    if type_encoder == 2

        prompt_encoded = 'Enter the message you want to ENCODE:';
        text = input(prompt_encoded);
    
            text_cap = upper(text);
            Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
            Map(Alphabet(1:27)) = 1:27; % assigns the numbers 1-26 to the letters of the alphabet. 'space' is 27.
            message = Map(text_cap); %'message' is a vector generated from the letters in 'text'.
            
            shift = randi([1,26], 1, 1); 
            encoded = message + shift; %shifts the entire message by a random number
            
            for ii = 1:length(message)
                if encoded(ii) >27
                    encoded(ii) = encoded(ii) - 27; %ensures that the assigned number loops. e.g. 27->1, not 28.
                end
            end
        disp("Here's your ENCODED message!: ");
        disp(encoded);

    % VIGENERE ENCODER
    elseif type_encoder == 3
        
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

        disp(["Here's your ENCODED message!: ", num2str(encMess)])
    
    % HILL ENCODER
    elseif type_encoder == 4
        
        disp("Sorry, the Hill encoder is not working right now.");
    
    end

% DECODING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif e_or_d == 1

    prompt_type = 'What type of cypher do you want to DECODE with? (2=Caesar, 3=Vigenere, 4=Hill):';
    type_decoder = input(prompt_type);

    % CAESAR DECODER
    if type_decoder == 2

        prompt_encoded = 'Enter the message you want to DECODE:';
        encoded = input(prompt_encoded);
            
            Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
            Map(1:27) = Alphabet(1:27); % same shift that the caesar encoder used, just from alpha to numbers.

            disp("Your decoded message is somewhere below: ");
            
            for ii = 1:27
                output = encoded + ii;
                for jj = 1:length(output)
                    if output(jj) >27
                    output(jj) = output(jj) - 27;
                    end
                end
                decoded = Map(output);
                disp(decoded); % brute force method that shifts through all the possibilities.
            end % Since there are only 26 possibilities, the Caesar cypher 
                % is easily crackable using a computer vs. by hand since it
                % can do a large number of shifts quickly.
                

    % VIGENERE DECODER
    elseif type_decoder == 3
        
        letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
        keyword = input("Please enter the keyword: ","S");
        
        keySize1 = size(keyword);
        keySize = keySize1(2);
        
        message = input("Please enter an encrypted message to decrypt: ", "S");
        
        messageSize1 = size(message);
        messageSize = messageSize1(2);
        
        if (messageSize <= keySize) && (MessageSize*2 > keySize)
            v = 1:messageSize;
            keyword = [keyword(v)];
        
        elseif (keySize < messageSize) && (messageSize <= 2*keySize)
            s3 = messageSize - keySize;
            v=1:s3;
            keyword = [keyword, keyword(v)];
        
        elseif messageSize > 2*keySize
            s3 = messageSize - 2*keySize;
            v = 1:s3;
            keyword = [keyword, keyword, keyword(v)];
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

    % HILL DECODER
    elseif type_decoder == 4

        disp("Sorry, the Hill decoder is not working right now.")

    end
    
else
    disp('Please try again.');

end

