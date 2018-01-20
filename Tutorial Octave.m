
% ============= Operaciones basicas ==============
5+6
3-2
5*8
1/2
2^6

% ============= Operaciones logicas ==============
1 == 2 % false
1 ~= 2 % Es diferente
1 && 0 % and
1 || 0 % Or
xor (1,0)

PS1('>> '); % desaparece el prompt de la consola y solo queda el >>

% ============= Variables ==============
a = 3
a = 3; %el punto y coma suprime el resultado
b = 'hola';
b
C = (3>=1); % evalua la respuesta lógica
C
a = pi;
a
disp(a)
disp(sprintf('2 decimals: %0,2f', a))
disp(sprintf('6 decimals: %0,6f', a))

format long % cambia la cantidad de decimales que muestra por defaultla octave
format short % cambia la cantidad de decimales que muestra por defaultla octave

% ============= Matrices ==============


A = [1 2; 3 4; 5 6]
A = [1 2;
3 4;
5 6]
V = [1 2 3] % vector fila
V = [1; 2; 3] % vector columna
V = 1:0.1:2 % desde 1 en incrementos de 0.2 hasta 2
ones(2,3) % matriz de unos
C = 2*ones(2,3) % matriz de dos tambien funciona para zeros
rand(1,3) % matriz de numeros aleatorios
randn(1,3) % matriz de numeros aleatorios incluyendo los negativos

w = -6 + sqrt(10)*(randn(1,10000)) % se pueden abordar operaciones mas complejas
hist(w)  % grafica un histograma basado en los resultados de w
hist(w,50) % cantidad de buckets
eye(4) % matriz diagonal  de orden 4
help eye
help help

% ============= Exploracion y mover datos ==============
size (A) %shape de A dimensiones

v = [1 2 3 4];
length(v) %cantidad de elementos
pwd %path working directory
cd 'C:zzzz' %cambia el pwd
ls % archivos en el pwd

load featuresX.dat % carga archivos del pwd
load('featuresX.dat')

who % muestra la cantidad de variables actuales
featuresX % es el show de las variables en este caso m
size featuresX
whos % vista detallada de las variables creadas

v = priceY(1:10) % los primeros 10 elementos del vector pricey

save hello.mat v % guardar en el archivo hello la variable v
save hello.txt v -ascii

size(A) % shape de la matriz
A(3,2) %un elemento particular de A
A(2,:)  % todas las columnbas de la fila 2
A([1 3],:) % filas 1 y 3 con todas las columnas
A(:,2) = [10; 11; 12] % reemplazar todas las filas de la columna dos por esos numeros
A = [A, [100; 101; 102]]  % adjuntar una columna con esos numeros a la derecha
A(:)  % poner todos los elementos de A en un solo vector

% ============= computando datos ==============
A = [1 2; 3 4; 5 6]
B = [11 12; 13 14; 15 16]
C = [1 1; 2 2]
V = [1; 2; 3]
a = [1 15 2 0.5]

A*C % mulitiplica las matrices

A.*B % multiplica las matrices elemento a lemento
A .^2 % eleva al cuadrado cada elemento
1 ./ A % la inversa de cada uno de los elementos de A
log (A)
exp(A)
abs(A)
-A %A pero negativa
V + ones(length(V), 1) % le suma 1 a cada uno de los elementos de V
V + 1 % lo mismo de arriba
A' %A transpuesta
val = max(a)  el valor máximo del vector a
[val, ind] = max(a) % el valor máximo de a y el indice donde se encuentra
a<3 %prueba logica elemento a elemento, devuelve un vector
find(a<3) %devuelve las posiciones de los que cumplen la condicion
magic(3) % devuelve una matriz de orden tres que cuyas filas columnas y diagonales suman lo mismo
[r, c] = find(A >= 7) % devuelve la fila y la columna de los elementos que cumplen la condicion
sum(a) %suma los elementos de a
prod(a) %los multiplica
floor(a) % les quita los decimales
rand(3) % matriz de numeros aleatorios de orden 3
max(A,[],1) % saca el valor máximo de cada columna de A
max(A,[],2) % saca el valor máximo de cada fila de A
max(A) %maximo de cada columna
max(max(A)) %máximo de toda la matriz
max(A(:)) % máximo de la matriz se se pone como vector
sum(A,1) % suma todas las columnas de A
sum(A,2) % suma todas las filas de A
pinv(A) % inversa de A

% ============= Graficos ==============

t = [0:0.01:0.98]
y1=sin(2*pi*4*t)
plot(t,y1)
y2 = cos(2*pi*4*t)
plot(t,y2)
plot(t,y1)
hold on % para sobreponer graficos
plot(t,y2,'r')
xlabel('time')
ylabel('value')
legend('sin','cos')
title('my plot')
cd 'C:/.......' ; print -dpng 'myPlot.png'
close % quita el grafico
figure(1); plot(t,y1) % se pueden asignar plots a figuras
subplot(1,2,1); % divide plot en un grid de 1x2 y accede al primer elemento
plot(t,y1)
subplot(1,2,2)
plot(t,y2)
axis([0.5 1 -1 1]) % le cambia los ejes al segundo elemento del grid
clf % limpia el tablero

% ============= Control de flujo ==============
v=zeros(10,1)
for i = 1:10,
    v(i)=2^i;
end; % reemplaza por 2 a la potencia del iesimo lugar
v
i = 1;
while i <= 5,
    v(i) = 100;
    i= i+1;
end; % sobre escribe 100 del 1 al 5to lugar

i = 1;
while true,
  v(i) = 999;
  i =  i + 1;
  if i == 6,
    break;
  end;
end; % va reemplazando todos los iesimos por 999 hasta que i=6

if v(1)==1,
  disp('The valiue is one');
elseif v(1) == 2,
  disp('The value is two');
else
  disp('The value is not one or two')
end;

% para las funciones se crea un archivo .m que tenga la funcion por ej:
% function y = squareThisNumber (x)
% y =  x^2

% se pone el cd 'C:/.....' donde estè el archivo y se ejecuta de la siguiente manera
squereThisNumber(5)

% tambièn pueden existir de multiples argumentos
% squareandCubeThisNumber.m
% function [y1, y2] = squareandCubeThisNumber (x)

% y1 = x^2;
% y2 = x^3;

[a,b] = squareandCubeThisNumber(5);

% design matrix
X = [1 1; 1 2; 1 3]
y = [1; 2; 3]
theta = [0;1]

%costfuncionJ.m
function J = costFuncionJ(X, y, theta)

% X es la matrix de diseño que contiene los ejemplos de entrenamiento
% y son las etiquetas de clase

m =  size(X,1);   % numero de ejemplos de entrenamiento
predicions = X*theta; % prediciones de hipotesis sobre todas los m ejemplos
sqrErrors =  (predicions-y).^2; % errores cuadrados

J = 1/(2*m) * sum(sqrErrors);

% se evalua
j = costFuncionJ(X,y,theta)
