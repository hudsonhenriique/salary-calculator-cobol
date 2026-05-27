       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALARY-CALC.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      * Entrada de dados do usuário
       01 WS-USER-INPUTS.
          05 WS-NAME             PIC X(30).
          05 WS-BASE-SALARY      PIC 9(05)V99.
          05 WS-TENURE           PIC 9(02).

      * Cálcular bonus e salário final
       01 WS-CALCULATIONS.
          05 WS-BONUS-PERCENT    PIC V99.
          05 WS-BONUS-VALUE      PIC 9(05)V99.
          05 WS-FINAL-SALARY     PIC 9(06)V99.

      * Formatação para exibição
       01 WS-DISPLAY.
          05 WS-DISP-BASE        PIC ZZZZ9.99.
          05 WS-DISP-BONUS       PIC ZZZZ9.99.
          05 WS-DISP-FINAL       PIC ZZZZZ9.99.

       01 WS-CONTROL.
          05 WS-MENU-OPTION      PIC 9 VALUE 1.

       PROCEDURE DIVISION.
           PERFORM MAIN-PROCEDURE.
           STOP RUN.

       MAIN-PROCEDURE.
           PERFORM MENU-LOOP UNTIL WS-MENU-OPTION = 2.

       MENU-LOOP.
           DISPLAY "=================================".
           DISPLAY " SISTEMA DE CALCULO DE SALARIO   ".
           DISPLAY " 1 - Calcular Salario            ".
           DISPLAY " 2 - Sair                        ".
           DISPLAY "=================================".
           DISPLAY "Escolha uma opcao: ".
           ACCEPT WS-MENU-OPTION.

           IF WS-MENU-OPTION = 1
              PERFORM INPUT-DATA
              PERFORM VALIDATE-DATA
              PERFORM CALCULATE-BONUS
              PERFORM CALCULATE-SALARY
              PERFORM DISPLAY-RESULT
           END-IF.

       INPUT-DATA.
           DISPLAY "Digite o nome do funcionario: ".
           ACCEPT WS-NAME.
           DISPLAY "Digite o salario base (Ex: 250000 para 2500.00): ".
           ACCEPT WS-BASE-SALARY.
           DISPLAY "Digite o tempo de empresa (em anos inteiros): ".
           ACCEPT WS-TENURE.

       VALIDATE-DATA.
           IF WS-BASE-SALARY = 0
              DISPLAY "AVISO: Salario base registrado como zero."
           END-IF.

       CALCULATE-BONUS.
           IF WS-TENURE <= 1
              COMPUTE WS-BONUS-VALUE = WS-BASE-SALARY * 0.05
           ELSE
              IF WS-TENURE >= 2 AND WS-TENURE <= 5
                 COMPUTE WS-BONUS-VALUE = WS-BASE-SALARY * 0.10
              ELSE
                 COMPUTE WS-BONUS-VALUE = WS-BASE-SALARY * 0.15
              END-IF
           END-IF.

       CALCULATE-SALARY.
           COMPUTE WS-FINAL-SALARY = WS-BASE-SALARY + WS-BONUS-VALUE.

       DISPLAY-RESULT.
           MOVE WS-BASE-SALARY TO WS-DISP-BASE.
           MOVE WS-BONUS-VALUE TO WS-DISP-BONUS.
           MOVE WS-FINAL-SALARY TO WS-DISP-FINAL.

           DISPLAY "---------------------------------".
           DISPLAY " RESUMO DO PAGAMENTO             ".
           DISPLAY "---------------------------------".
           DISPLAY "Nome..........: " WS-NAME.
           DISPLAY "Salario Base..: R$ " WS-DISP-BASE.
           DISPLAY "Bonus Gerado..: R$ " WS-DISP-BONUS.
           DISPLAY "Salario Final.: R$ " WS-DISP-FINAL.
           DISPLAY "---------------------------------".