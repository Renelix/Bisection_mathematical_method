function [m] = Metodo_delle_bisezioni(f, a, b, toll)
    %{
    Antonio Caiafa

    Programma per la ricerca del valore più vicino tale che f(x)=0 che ha come input:
    f la funzione di cui si ricerca il valore.
    a primo valore dell'intervallo di ricerca.
    b secondo valore dell'intervallo di ricerca.
    toll tolleranza con cui deve essere ricercato il valore.
    %}

    % Inizializzazione variabile iterazioni, utilizzata come indice all'interno del ciclo while iterativo.
    iterazioni=0;
    
    % Dichiarazione variabile imax, utilizzata per delieneare il numero massimo di cicli per evitare che il ciclo vada in loop.
    imax=100;
    
    % Condizione attraverso costrutto if, per controllare se all'interno dell'intervallo inserito è presente almeno un punto in cui la funzione si annulla.
    if(f(a)*f(b)>0)
        m="Il metodo delle bisezioni non è applicabile.";
        fprintf("L'intervallo selezionato non contine nessuno 0,\nper cui (se la funzione è continua e monotona) si consiglia di inserire un'altro intervallo [a b]");

        % Comando per uscire dal programma,
        return

    % Fine della condizione if.
    end
    
    % Assegnazione alla variabile m il valore di (a+b)/2 trovando il punto medio.
    m=(a+b)/2;

    % Ciclo iterativo while che continua fino a quando la condizione è soddisfatta, e determina m il punto più vicino allo 0 della funzione prendendo in considerazione la tolleranza, le iterazioni e se trova lo 0.
    while(f(m)~=0 & (abs(f(m))>=toll | abs(b-a)>=toll) & iterazioni<imax)

        % Incremento indice di controllo per il contatore.
        iterazioni=iterazioni+1;

        % Controllo tramite costrutto if, per la presa in considerazione dell'intervallo tramite il punto più vicino allo 0 della funzione.
        if(f(a)*f(m)<=0)
            b=m;
        else
            a=m;
        end

        % Assegnazione alla variabile m il valore di (a+b)/2 trovando il punto medio.
        m=(a+b)/2;
        
        % Stampa a video dei valori m e dei valori f(m) e della funzione di cui si sta cercando il punto piu vicino allo 0.
        plot(m, 0, "*");
        plot(m, f(m), "s");
        
        % Comando per la sovrapposizione di più grafici senza la cancellazione dei grafici precedenti.
        hold on
        fplot(@(x)f(x), [a b])

    % Fine ciclo iterativo while che continua fino a quando la condizione è soddisfatta, e determina m il punto più vicino allo 0 della funzione prendendo in considerazione la tolleranza.
    end

    % Stampa delle iterazioni effettuate per la ricerca del punto più vicino allo 0 tenendo conto della tolleranza.
    fprintf("Il numero di iterazioni effettuate durante il while è pari a:\n");
    iterazioni
    
    % Stampa del commento sul numero più vicino allo 0 della funzione tenendo conto della tolleranza dopo il quale sarà stampato il valore in questione.
    fprintf("\nIl numero approssimato di x, per cui f(x)=0, all'interno della variabile m è pari a:\n");

% Fine programma.
end