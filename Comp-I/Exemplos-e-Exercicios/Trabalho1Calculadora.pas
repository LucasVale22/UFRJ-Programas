program CALCULADORA;

uses Crt;

function adicao(x,y: real):real;
    begin
         adicao := x + y;
	end;
	
function subtracao(x,y: real):real;
	begin
		subtracao := x - y;
	end;
	
function multiplicacao(x,y: real):real;
	begin
		multiplicacao := x*y;
	end;
	
function divisao(x,y: real; var c: char):real;      //cmd foi passado no programa principal, por refer�ncia
	begin
		if (y = 0) then
			begin
				writeln('Imposs�vel dividir por ZERO!');
                c := 'a';       //c permite altera��o no cmd (que est� no programa principal). Aqui � atribu�do o comando 'a' para que a calculadora reinicie sozinha, devido a incoer�ncia no c�lculo
			end
		else
			begin
				divisao := x/y;
			end;
	end;
	
function inversao(x:real; var c: char):real;
	begin
		if(x = 0)then
			begin
				writeln('Imposs�vel inverter ZERO!');
                c := 'a';
			end
		else
			begin
				inversao := 1/x;
			end;
	end;

function potenciacao(x,y: real; var c: char):real;
	begin
		if((x = 0) AND (y <= 0))then
			begin
				writeln('Indeterminado!');
                c := 'a';
			end
		else
			begin
				potenciacao := power(x,y);
			end;
	end;
	
function raizQuadrada(x:real; var c: char):real;
	begin
		if(x < 0)then
			begin
				writeln('N�mero Imagin�rio!');
                c := 'a';
			end
		else
			begin
				raizQuadrada := sqrt(x);
			end;
	end;

var
	n1,n2,res: real;
    cmd: char;

begin
	writeln('***CALCULADORA***');
	writeln;
	writeln('Comandos: para utilizar um comando, basta digitar o s�mbolo/express�o correspondente e em seguida pressionar a tecla ENTER.');
    writeln('N�meros: para informar um n�mero digite o mesmo e em seguida pressiona a tecla ENTER.');
    writeln;
	writeln('+: adi��o');
    writeln('-: subtra��o');
    writeln('*: multiplica��o');
    writeln('/: divis�o');
    writeln('i: invers�o');
    writeln('p: potencia��o');
    writeln('r: raiz quadrada');
    writeln('a: apagar valor guardado/reiniciar calculadora');
    writeln('s: sair da calculadora');
    writeln;
    writeln('Digite um comando: ');
	readln(cmd);

 while (cmd <> 's')do    //mant�m o la�o de repeti��o at� que seja digitado o comando 'sair', finalizando assim, a calculadora
    begin
		n1 := 0;
		n2 := 0;
		res := 0;
		
		if(cmd <> 'a')then
		begin
			writeln('Digite um numero: ');
			readln(n1);
		end;
		
		while (cmd <> 'a')do      //mant�m la�o de repeti��o at� que seja digitado o comando 'apagar', reiniciando assim, a calculadora, ou digitado o comando sair, para que finalize o la�o
		begin
			if((cmd = '+') OR (cmd = '-') OR (cmd = '*') OR (cmd = '/') OR (cmd = 'p'))then    //s� entrar� nessa condi��o, caso seja solicitada uma opera��o que exija mais de um n�mero
			begin
						 writeln('Digite um numero: ');
						 readln(n2);
			end;

			case cmd of

				'+': begin
						res := adicao(n1,n2);
					 end;
				
				'-': begin
						  res := subtracao(n1,n2);
					 end;
					 
				'*': begin
						  res := multiplicacao(n1,n2);
					 end;
					 
				'/': begin
						  res := divisao(n1,n2,cmd);
					 end;
					 
				'i': begin
						  res := inversao(n1,cmd);
					 end;
					 
				'p': begin
						  res := potenciacao(n1,n2,cmd);
					 end;
					 
				'r': begin
						  res := raizQuadrada(n1,cmd);
					 end;
                's': begin
                          break;
                     end
				else
					begin
								if(cmd <> 'a')then
								begin
									 writeln('Comando Inv�lido!');
									 cmd := 'a';
								end;
					end;


			end;

            if(cmd <> 'a')then  //s� entrar� neste bloco se o programa n�o fazer automaticamente a limpeza do valor guardado. Ou seja, se cmd n�o recebeu automaticamente o comando 'a', � porque n�o houve incoer�ncia no c�lculo
            begin
                //if(cmd <> 's')then
                 //begin
                    writeln('Total: ',res);
			        n1 := res;
			        writeln('Digite um comando: ');
			        readln(cmd);
                //end;
            end
            else
            begin
                //if(cmd <> 's')then
				//begin
                    writeln('Calculadora reiniciada por incoer�ncia. A mem�ria foi limpa!');
                //end
            end;

	    end;

		if(cmd <> 's')then
		begin
			writeln('Digite um comando: ');
			readln(cmd);
		end;

	end;
 writeln('Voc� saiu da calculadora');
 readln;
end.


