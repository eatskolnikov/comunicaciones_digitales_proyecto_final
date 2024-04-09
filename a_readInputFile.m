% Abrir el archivo de imagen en modo 'lectura'
fileID = fopen('files/imagen.bmp', 'r');

% Leer el archivo como 'uint8' para obtener la representación numérica de los píxeles
data = fread(fileID, '*uint8');

% Cerrar el archivo
fclose(fileID);

% Convertir los datos a su representación binaria
% Cada 'uint8' se convierte a 8 bits, formando una secuencia de bits
bitSequence = dec2bin(data, 8)';

% Convertir la matriz de caracteres en una secuencia lineal de bits
bitSequence = bitSequence(:);

% Opcional: Convertir la secuencia de caracteres de bits a un vector numérico de 0s y 1s
bitVector = bitSequence - '0';

% La longitud del vector de bits
nBits = length(bitVector);

% Crear un vector de tiempo, asumiendo 1 segundo entre cada bit (esto es solo un ejemplo,
% deberías ajustar el paso de tiempo según la tasa de bits que desees)
timeVector = (0:nBits-1)';

% Combinar el vector de tiempo y los datos en una sola matriz
simin = [timeVector, double(bitVector)];
