PROGRAM Format(INPUT, OUTPUT);
VAR
  InputFile: TEXT;
  Ch1, Ch2, Ch3, Ch4, Ch5: CHAR;
BEGIN;

  ASSIGN(InputFile, 'inpt.txt');
  
  RESET(InputFile);
  Ch1 := ' ';
  Ch2 := ' '; 
  WHILE NOT EOLN(InputFile)
  DO
    BEGIN
    Ch1 := Ch2;
    READ(InputFile, Ch2);  
    
    IF (Ch2 <> ' ')
    THEN
      {Обработка значений в операторах}
      IF (Ch2 = '(')
      THEN
        BEGIN
        WHILE (Ch1 <> ')')
        DO
          BEGIN
            IF (Ch1 = ',') AND (Ch2 = ' ')
            THEN
              WRITE(OUTPUT, Ch2);
            IF (Ch1 = ',') AND (Ch2 <> ' ')
            THEN
              WRITE(OUTPUT, ' ');
            IF (Ch2 <> ' ')
            THEN
              WRITE(OUTPUT, Ch2);
            Ch1 := Ch2;
            READ(InputFile, Ch2)
          END;
          IF (Ch2 = ' ')
          THEN
            BEGIN
              Ch1 := Ch2;
              READ(InputFile, Ch2);
            END;
          {Проверка на END}
          IF (Ch2 <> 'E')
          THEN
            BEGIN
              IF (Ch2 = ' ')
              THEN
                BEGIN
                  WHILE (Ch2 = ' ')
                  DO
                    BEGIN
                      Ch1 := Ch2;
                      READ(InputFile, Ch2);
                    END;
                END;
              IF (Ch2 <> 'E')
              THEN
                BEGIN  
                  WRITE(OUTPUT, Ch2);
                  WRITELN(OUTPUT);
                END
              ELSE IF (Ch2 = 'E')
              THEN
                BEGIN
                  WRITELN(OUTPUT);
                  WRITE(OUTPUT, Ch2);
                END;  
            END
          ELSE IF (Ch2 = 'E')
          THEN
            BEGIN
              WRITELN(OUTPUT);
              WRITE(OUTPUT, Ch2);
            END;    
          IF (Ch2 = ';')
          THEN
            WRITE(OUTPUT, '  ')
          {Конец Проверка на END}
        END
      {Конец Обработка значений в операторах}
      {Проверка BERGIN}
      ELSE IF (Ch1 = 'B') AND (Ch2 = 'E')
      THEN
        BEGIN
          WHILE (Ch1 <> 'I') AND (Ch2 <> 'N')
          DO
            BEGIN
              WRITE(OUTPUT, Ch2);
              Ch1 := Ch2;
              READ(InputFile, Ch2);
            END;
          WRITE(OUTPUT, Ch2);
          WRITELN(OUTPUT);
          WRITE(OUTPUT, '  ')
        END
      {Конец Проверка BERGIN}
      ELSE IF (Ch2 = ';')
      THEN
        BEGIN 
          WRITE(OUTPUT, Ch2);
          WRITELN(OUTPUT);
          WRITE(OUTPUT, '  ')
        END
      ELSE
        WRITE(OUTPUT, Ch2)
    END        
END.
