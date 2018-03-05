program CALCULADORA;

uses Crt;

procedure menu;
          begin
           writeln('***CALCULADORA***');
           writeln;
           writeln('Comandos: para utilizar um comando, basta digitar o simbolo/expressao correspondente e em seguida pressionar a tecla ENTER.');
           writeln('Numeros: para informar um numero digite o mesmo e em seguida pressiona a tecla ENTER.');
           writeln;
           writeln('+: adicao');
           writeln('-: subtracao');
           writeln('*: multiplicacao');
           writeln('/: divisao');
           writeln('i: inversao');
           writeln('p: potenciacao');
           writeln('r: raiz quadrada');
           writeln('a: apagar valor na memoria');
           writeln('s: sair da calculadora');
           writeln;
          end;

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
				writeln('Impossivel dividir por ZERO!');
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
			begin				writeln('Impossivel inverter ZERO!');

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
				writeln('N�mero Imaginario!');
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
    menu;

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
                        clrscr;
                        menu;
						res := adicao(n1,n2);
					 end;
				
				'-': begin
                          clrscr;
                          menu;
						  res := subtracao(n1,n2);
					 end;
					 
				'*': begin
                          clrscr;
                          menu;
						  res := multiplicacao(n1,n2);
					 end;
					 
				'/': begin
                          clrscr;
                          menu;
						  res := divisao(n1,n2,cmd);
					 end;
					 
				'i': begin
                          clrscr;
                          menu;
						  res := inversao(n1,cmd);
					 end;
					 
				'p': begin
                          clrscr;
                          menu;
						  res := potenciacao(n1,n2,cmd);
					 end;
					 
				'r': begin
                          clrscr;
                          menu;
						  res := raizQuadrada(n1,cmd);
					 end;
                's': begin
                          clrscr;
                          menu;
                          break;
                     end
				else
					begin
								if(cmd <> 'a')then
								begin
                                     clrscr;
                                     menu;
									 writeln('Comando Invalido!');
									 cmd := 'a';
								end;
					end;


			end;

            if(cmd <> 'a')then  //s� entrar� neste bloco se o programa n�o fazer automaticamente a limpeza do valor guardado. Ou seja, se cmd n�o recebeu automaticamente o comando 'a', � porque n�o houve incoer�ncia no c�lculo
            begin
                    clrscr;
                    menu;
                    writeln('Total na Memoria: ',res:3:4);
                    writeln;
			        n1 := res;
			        writeln('Digite um comando: ');
			        readln(cmd);
            end
            else

	    end;

		if(cmd <> 's')then
		begin
          if(cmd = 'a')then
          begin
               res := 0;
               writeln('Total na Memoria: ',res:3:4);
          end;
  	      writeln('Digite um comando: ');
          readln(cmd);
		end;

	end;
 clrscr;
 writeln('Voce saiu! Obrigado por utilizar a Calculadora.');
 readln;
end.


