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
        
            Alphabet2 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
            encoded = Alphabet2(encoded);

        disp("Here's your ENCODED message!: ");
        disp(encoded);

    % VIGENERE ENCODER
    elseif type_encoder == 3
        
        %Creating an alphabet vector which will be related to the position of the
        %letters (1-26). Only uppercase inputs will work for both inputs!

        letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
        keyword = input("Please enter the keyword: ","S");
        
        %Measuring the size of the keyword (number of letters)
        size_key = size(keyword);
        s1 = size_key(2);
        
        %Measuring the size of the inputted message (number of letters)
        message = input("Please enter a message to encrypt: ", "S");
        message = message(find(~isspace(message))); 
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
        numbersShiftedvec = letter2numKeyword + letter2numMessage + 1;
        
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

        disp(["Here's your ENCODED message!: ", num2str(encMess)])
    
    % HILL ENCODER
    elseif type_encoder == 4

        %Takes Input of what the user wants to be encoded
        prompt_encoded = 'Enter the message you want to ENCODE:';
        text = input(prompt_encoded);
    
            %Changes letters into numbers
            text_cap = upper(text);
            Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
            Map(Alphabet(1:27)) = 1:27;
            message = Map(text_cap) - 1; % Adjusts the sequence so that it matches with sequence that the official Codebusters uses

            key_prompt = 'What is the 4 letter keyword:';
            key_letter = input(key_prompt);
            Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
            Map(1:27) = Alphabet(1:27);
            key_unshaped = Map(key_letter) - 1;

            key = reshape(key_unshaped, 2, 2);
            key = key';

            for i = 1:2:length(message)
                encry = [message(i); message(i+1)];
                encry_num = mtimes(key,encry);
                output(i) = [encry_num(1)];
                output(i+1) = [encry_num(2)];
            end       

            Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';

            output = mod(output,26)+1; %Undoes the earlier adjustment to letter to number conversion and does mod to fit it into 1:27 range
            output = Alphabet(output);
            disp(output)
           
    
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
            Map(Alphabet(1:27)) = 1:27; % assigns the numbers 1-26 to the letters of the alphabet. 'space' is 27.
            encoded = Map(encoded); %'message' is a vector generated from the letters in 'text'.
            
            disp("Your decoded message is somewhere below: ");
            
            for ii = 1:27
                output = encoded + ii;
                for jj = 1:length(output)
                    if output(jj) >27
                    output(jj) = output(jj) - 27;
                    end
                end
                
            Alphabet2 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
            Map2(1:27) = Alphabet2(1:27);
            decoded = Map2(output);
            
                disp(decoded); % brute force method that shifts through all the possibilities.
            end % Since there are only 26 possibilities, the Caesar cypher 
                % is easily crackable using a computer vs. by hand since it
                % can do a large number of shifts quickly.
                

    % VIGENERE DECODER
    elseif type_decoder == 3
        
        %Creating an alphabet vector which will be related to the position of the
        %letters (1-26). Only uppercase inputs will work for both inputs!

        letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
        keyword = input("Please enter the keyword: ","S");
        
        %Measuring the size of the keyword (number of letters)
        keySize1 = size(keyword);
        keySize = keySize1(2);
        
        %KEY NOTE: THE MESSAGE SHOULD BE INPUTTED AS IF THE PHRASE HAS NO
        %SPACES IN BETWEEN WORDS (Ex. one must enter the encrypted version of HISHREY, not HI SHREY)!!
        message = input("Please enter an encrypted message to decrypt: ", "S");
        
        %Measuring the size of the inputted message (number of letters)
        messageSize1 = size(message);
        messageSize = messageSize1(2);
        
        if (messageSize <= keySize) && (MessageSize*2 > keySize)
            v = 1:messageSize;
            keyword = [keyword(v)];
        %This first if statement considers the possibility that the keyword is
        %longer than the actual message itself!

        elseif (keySize < messageSize) && (messageSize <= 2*keySize)
            s3 = messageSize - keySize;
            v=1:s3;
            keyword = [keyword, keyword(v)];
        %This second elseif statement considers the possibility that the message length is
        %inbetween the size of the keyword and twice the size of the keyword!

        elseif messageSize > 2*keySize
            s3 = messageSize - 2*keySize;
            v = 1:s3;
            keyword = [keyword, keyword, keyword(v)];
        end
        %This for loop accounts for cases where the resultant numerical value is
        %greater than 26, which is out of the scope of the alphabet.

        for i=1:messageSize
            messageNumpos(i) = find(letters == (message(i)))-1;
            keyNumpos(i) = find(letters == (keyword(i)))-1;
        end
        numShift = messageNumpos - keyNumpos + 1; %Here is the main difference in code between encoder and decoder. Rather than adding the keyword shift, we're subtracting now!
        
        %This for loop accounts for cases where the resultant numerical value is
        %greater than 26, which is out of the scope of the alphabet.
        for i=1:messageSize
            if numShift(i) < 0
                numShift(i) = mod(numShift(i), 26);
            elseif numShift(i) == 0
                numShift(i) = 26;
            end
        end
        
        %Converting the final numbers back to letters for display of the encrypted
        %message!
        for i = 1:messageSize
            decFinal(i) = letters(numShift(i));
        end
        
        disp(["DECRYPTED MESSAGE: ", num2str(decFinal)])

    % HILL DECODER
    elseif type_decoder == 4
        % Takes user input on what they want to be encoded
        prompt_encoded = 'Enter the message you want to DECODE:';
        text = input(prompt_encoded);

        text_cap = upper(text);
        Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
        Map(Alphabet(1:27)) = 1:27;
        message = Map(text_cap)-1;

        %Take keyword and convert into a 2x2 matrix of numbers
        key_prompt = 'What is the 4 letter keyword \n';
        key_letter = input(key_prompt);
        Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
        Map(1:27) = Alphabet(1:27);
        key_unshaped = Map(key_letter);

        key = reshape(key_unshaped, 2, 2);
        key = key';


        Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
        Map(1:27) = Alphabet(1:27);

        %Now find the inverse matrix using mod(26)
        key1 = key;
        inv_key1(1,1) = key1(2,2) - 1;
        inv_key1(2,2) = key1(1,1) - 1;
        inv_key1(1,2) = -1 * (key1(1,2) - 1);
        inv_key1(2,1) = -1 * (key1(2,1) - 1);
        inv_key = mod(inv_key1, 26);

        %Determinant determinantion
        determinant = mod(det(inv_key),26);

        %Gives Equivalent value for determinant based on paramters of what
        %is given on the Science Olympiad Test and extended Euclidean
        %algorithm
        if determinant == 1
            determinant = 1;
        elseif determinant == 3
            determinant = 9;
        elseif determinant == 5
            determinant = 21;
        elseif determinant == 7
            determinant =15;
        elseif determinant == 9
            determinant = 3;
        elseif determinant == 11
            determinant = 19;
        elseif determinant == 15
            determinant = 7;
        elseif determinant == 17
            determinant = 23;
        elseif determinant == 19
            determinant = 11;
        elseif determinant == 21
            determinant = 5;
        elseif determinant == 23
            determinant = 17;
        elseif determinant == 25
            determinant = 25;
        else
            disp("Please choose a new key word and run the program again")
        end


        %Finding a equivalent 
        inv_key = mod(determinant .* inv_key, 26);

       %Now use determinant to find cipher by dividing message into chunks
       %of 2 and then multiply by inv_key
        for i = 1:2:length(message)
            decry = [message(i); message(i+1)];
            decode_num = mtimes(inv_key, decry);
            decrypted_num(i) = [decode_num(1)'];
            decrypted_num(i+1) = [decode_num(2)'];
        end

        decrypted = mod(decrypted_num, 26)+1;

        Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';

        decrypted = Alphabet(decrypted);
        disp(decrypted)

    end
    
else
    disp('Please try again.');

end

