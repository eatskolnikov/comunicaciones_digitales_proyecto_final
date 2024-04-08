load('files/receivedFileData.mat','received_binary_data');  % Carga sólo la variable 'binaryData'

% Dividir la cadena en segmentos de 8 bits y convertirlos a texto
textData = '';

disp(length(received_binary_data))
for i = 1:8:length(received_binary_data)-7
    binSegment = received_binary_data(2, i:i+7);
    binStr = num2str(binSegment);
    binStr(binStr == ' ') = '';
    textData = [textData, char(bin2dec(binStr))];
end

% Guardar el texto decodificado en un archivo .txt
fileID = fopen('receivedFile.txt', 'w');
fprintf(fileID, '%s', textData);
fclose(fileID);

disp('El texto decodificado ha sido guardado en decodedText.txt');