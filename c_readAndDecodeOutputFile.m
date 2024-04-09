load('files/receivedFileData.mat','received_binary_data');  % Carga sólo la variable 'binaryData'

% La información de la imagen está en la segunda dimensión
image_binary_data = received_binary_data(2, :);

% Inicializar un vector para almacenar los bytes de la imagen
imageData = uint8([]);

% Dividir la secuencia de bits en segmentos de 8 bits y convertirlos a bytes numéricos
for i = 1:8:length(image_binary_data)-7
    % Extraer un segmento de 8 bits
    binSegment = image_binary_data(i:i+7);
    % Convertir el segmento binario a un número decimal (byte)
    byte = bin2dec(num2str(binSegment));
    % Añadir el byte al vector de la imagen
    imageData = [imageData, byte];
end

% Guardar los datos de la imagen en un archivo .bmp
fileID = fopen('files/receivedFile.bmp', 'wb');  % Notar el 'wb' para modo de escritura binaria
fwrite(fileID, imageData, 'uint8');
fclose(fileID);

disp('La imagen decodificada ha sido guardada en receivedFile.bmp');