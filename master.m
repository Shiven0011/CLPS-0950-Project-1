% Cyphers Project 1
% CLPS 0950, Brown University, Spring 2023
% Sid Udata, Shiven Sassipalli, Shrey Mehta

prompt_E_or_D = ['Would you like to ENCODE or DECODE a message?' ...
    '(0=encode, 1=decode): '];
e_or_d = input(prompt_E_or_D);

% ENCODING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if e_or_d == 0

    prompt_type = 'What type of cypher do you want to ENCODE with? (2=Caesar, 3=Venetian, 4=Hill):';
    type_encoder = input(prompt_type);

    % CAESAR ENCODER
    if type_encoder == 2

        prompt_encoded = 'Enter the message you want to ENCODE:';
        text = input(prompt_encoded);
    
            text_cap = upper(text);
            Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
            Map(Alphabet(1:27)) = 1:27;
            message = Map(text_cap); %'message' is a vector generated from the letters in 'text'.
            
            shift = randi([1,26], 1, 1); %'shift' is a random scalar that is used to shift the caesar cypher.
            
            encoded = message + shift;
            
            for ii = 1:length(message)
                if encoded(ii) >27
                    encoded(ii) = encoded(ii) - 27;
                end
            end
        disp("Here's your ENCODED message!: ");
        disp(encoded);

    % VENETIAN ENCODER
    elseif type_encoder == 3
        
        disp("Sorry, the Venetian encoder is not working right now.");
    
    % HILL ENCODER
    elseif type_encoder == 4

        prompt_encoded = 'Enter the message you want to ENCODE:';
        text = input(prompt_encoded);
    
            text_cap = upper(text);
            Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
            Map(Alphabet(1:27)) = 1:27;
            message = Map(text_cap) - 1;

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

            output = mod(output,26)+1;
            output = Alphabet(output);
            disp(output)
           
    
    end

% DECODING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif e_or_d == 1

    prompt_type = 'What type of cypher do you want to DECODE with? (2=Caesar, 3=Venetian, 4=Hill):';
    type_decoder = input(prompt_type);

    % CAESAR DECODER
    if type_decoder == 2

        prompt_encoded = 'Enter the message you want to DECODE:';
        encoded = input(prompt_encoded);
            
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

    % VENETIAN DECODER
    elseif type_decoder == 3

        disp("Sorry, the Venetian decoder is not working right now.")

    % HILL DECODER
    elseif type_decoder == 4
        % Takes user input on what they want to be encoded
        prompt_encoded = 'Enter the message you want to DECODE:';
        text = input(prompt_encoded);

        text_cap = upper(text);
        Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
        Map(Alphabet(1:27)) = 1:27;
        message = Map(text_cap);

        %Take keyword and convert into a 2x2 matrix of numbers
        key_prompt = 'What is the 4 letter keyword \n';
        key_letter = input(key_prompt);
        Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
        Map(1:27) = Alphabet(1:27);
        key_unshaped = Map(key_letter);

        key = reshape(key_unshaped, 2, 2);


        Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
        Map(1:27) = Alphabet(1:27);

        %Now find the inverse matrix using mod(26)
        key1 = key;
        inv_key1(1,1) = key1(2,2) - 1;
        inv_key1(2,2) = key1(1,1) - 1;
        inv_key1(1,2) = -1 * (key1(1,2) - 1);
        inv_key1(2,1) = -1 * (key1(2,1) - 1);
        inv_key = mod(inv_key1, 26);
        determinant = mod(det(inv_key),26);
        inv_key = mod(inv_key .* (1/determinant), 26);
        disp(inv_key)
        fill = mod([9, 25], 26)

       %Now use determinant to find cipher
        for i = 1:2:length(message)
            decry = [message(i), message(i+1)]
            decode_num = decry * inv_key;
            decrypted_num(i) = [decode_num(1)'];
            decrypted_num(i+1) = [decode_num(2)'];
        end
        disp(decrypted_num)

        decrypted = Map(decrypted_num);
        disp(decrypted);

    end
    
else
    disp('Please try again.');

end

