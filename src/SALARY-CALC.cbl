       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALARY-CALC.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  WS-USER-INPUTS.
           05 WS-NAME             PIC X(30).
           05 WS-BASE-SALARY      PIC 9(06)V99.
           05 WS-TENURE           PIC 9(02).

       01  WS-CALCULATIONS.
           05 WS-BONUS-PERCENT    PIC V99.
           05 WS-BONUS-VALUE      PIC 9(06)V99.
           05 WS-FINAL-SALARY     PIC 9(07)V99.

       01  WS-DISPLAY.
           05 WS-DISP-BASE        PIC ZZZZZ9.99.
           05 WS-DISP-BONUS       PIC ZZZZZ9.99.
           05 WS-DISP-FINAL       PIC ZZZZZZ9.99.

       01  WS-CONTROL.
           05 WS-MENU-OPTION      PIC 9 VALUE 1.
           05 WS-PAUSE            PIC X.

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           PERFORM MENU-LOOP
              UNTIL WS-MENU-OPTION = 2.
           STOP RUN.

       MENU-LOOP.
           DISPLAY '================================='.
           DISPLAY ' SISTEMA DE CALCULO DE SALARIO   '.
           DISPLAY ' 1 - Calcular Salario            '.
           DISPLAY ' 2 - Sair                        '.
           DISPLAY '================================='.

           DISPLAY 'Escolha uma opcao: '.
           ACCEPT WS-MENU-OPTION.

           IF WS-MENU-OPTION = 1
              PERFORM INPUT-DATA
              PERFORM VALIDATE-DATA
              PERFORM CALCULATE-BONUS
              PERFORM CALCULATE-SALARY
              PERFORM DISPLAY-RESULT.

       INPUT-DATA.
           DISPLAY 'Digite o nome do funcionario: '.
           ACCEPT WS-NAME.

           DISPLAY 'Digite o salario base: '.
           ACCEPT WS-BASE-SALARY.

           DISPLAY 'Digite o tempo de empresa: '.
           ACCEPT WS-TENURE.

       VALIDATE-DATA.
           IF WS-BASE-SALARY = 0
              DISPLAY 'AVISO: SALARIO ZERO.'.

       CALCULATE-BONUS.

           MOVE 0 TO WS-BONUS-PERCENT.

           IF WS-TENURE NOT GREATER THAN 1
              MOVE .05 TO WS-BONUS-PERCENT.

           IF WS-TENURE GREATER THAN 1
              IF WS-TENURE NOT GREATER THAN 5
                 MOVE .10 TO WS-BONUS-PERCENT.

           IF WS-TENURE GREATER THAN 5
              MOVE .15 TO WS-BONUS-PERCENT.

           COMPUTE WS-BONUS-VALUE =
              WS-BASE-SALARY * WS-BONUS-PERCENT.

       CALCULATE-SALARY.
           COMPUTE WS-FINAL-SALARY =
              WS-BASE-SALARY + WS-BONUS-VALUE.

       DISPLAY-RESULT.

           MOVE WS-BASE-SALARY
              TO WS-DISP-BASE.

           MOVE WS-BONUS-VALUE
              TO WS-DISP-BONUS.

           MOVE WS-FINAL-SALARY
              TO WS-DISP-FINAL.

           DISPLAY '---------------------------------'.
           DISPLAY ' RESUMO DO PAGAMENTO             '.
           DISPLAY '---------------------------------'.

           DISPLAY 'Nome..........: ' WS-NAME.
           DISPLAY 'Salario Base..: ' WS-DISP-BASE.
           DISPLAY 'Bonus Gerado..: ' WS-DISP-BONUS.
           DISPLAY 'Salario Final.: ' WS-DISP-FINAL.

           DISPLAY '---------------------------------'.

           DISPLAY 'Pressione ENTER para continuar.'.
           ACCEPT WS-PAUSE.