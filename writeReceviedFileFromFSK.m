load('received_file.mat','received_binary_data');  % Carga sólo la variable 'binaryData'

% Dividir la cadena en segmentos de 8 bits y convertirlos a texto
textData = '';

disp(length(received_binary_data))
for i=1:8:length(received_binary_data)
    disp(i)
    binSegment = received_binary_data(2,i:i+7)
    textData = [textData, char(bin2dec(binSegment))]
end

disp(textData)
%intArray = int32(received_binary_data(2))
%strArray = string(char(intArray));


%fileID = fopen('outputText.txt', 'w');
%fprintf(fileID, '%s', textData);
%fclose(fileID);