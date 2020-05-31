! 2020 - 25 - 5
! caminos1DD.f90
! Félix Cabrera (walberto.cabrera@gmail.com)

! CAMINATAS ALEATORIAS EN UNA DIMENCION
! PASO CONTINUO.

! Codificación del texto: UTF-8
! Compiladores probados: GNU Fortran (Ubuntu 9.2.1-9ubuntu2) 9.2.1 2019008

! Instrucciónes de compilación: no requiere nada más
! gfortran -Wall -pedantic -std=f95 caminos1DD_carac.f90 -o caminos1DD
! ./caminos1DD

PROGRAM caminos

  IMPLICIT NONE
  
  ! Declaramos variables principales
  INTEGER(4):: posicion, paso, pasosmax
  ! Variables auxiliares
  REAL (4) :: x,a, tprom

  INTEGER(4):: i,j, retorno, noretorno, tiempo
  ! Variable de control
  
  tiempo = 0
  retorno = 0
  noretorno = 0
  pasosmax = 10000
  posicion = 0
  paso = 0
  
  DO j=1, 1000
    DO i=1, pasosmax
  
      CALL RANDOM_NUMBER(x)
      CALL RANDOM_NUMBER(a)
    
      paso= (INT(x*10))*((-1)**(INT(a*2)))
      ! Esta parte mueve la particula
      posicion = posicion + paso  
   
      IF (posicion==0) THEN
        tiempo = tiempo + i
        retorno = retorno + 1
        EXIT 
      END IF
      IF (i==(pasosmax-1)) noretorno = noretorno +1
    END DO
  END DO
  
  tprom = real(tiempo,4)/real(retorno,4)
  
  print*,'tiempo promedio de retorno',tprom
  print*,'veces que no retorno',noretorno
  
END PROGRAM caminos






















