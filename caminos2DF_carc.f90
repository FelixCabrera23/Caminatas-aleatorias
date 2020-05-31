! 2020 - 25 - 5
! caminos2DD.f90
! Félix Cabrera (walberto.cabrera@gmail.com)

! CAMINATAS ALEATORIAS EN UNA DIMENCION
! PASO CONTINUO.

! Codificación del texto: UTF-8
! Compiladores probados: GNU Fortran (Ubuntu 9.2.1-9ubuntu2) 9.2.1 2019008

! Instrucciónes de compilación: no requiere nada más
! gfortran -Wall -pedantic -std=f95 caminos2DF_carc.f90 -o caminos2DFc
! ./caminos2DFc

PROGRAM caminos2d

  IMPLICIT NONE
  
  ! Declaramos variables principales
  INTEGER(4):: x,y,xn,yn,paso, pasosmax
  ! Variables auxiliares
  REAL (4) :: a,b,c, tprom, probretorn

  INTEGER(4):: i,j,k, retorno, noretorno, tiempo
  

  ! iniciamos las variables
  x = 0
  y = 0
  paso = 0
  pasosmax = 10000
  retorno = 0
  noretorno = 0
  tiempo = 0

  DO j=1, 100000
    DO i=1, pasosmax
  
      CALL RANDOM_NUMBER(a)
      CALL RANDOM_NUMBER(b)
      CALL RANDOM_NUMBER(c)
      ! Esta parte mueve la particula hacia adleante o atras
      paso= (INT(a*10))*((-1)**(INT(b*2)))
      !esto decide si arriba o abajo
      k=INT(c*2)
      xn=x+(k*paso)
      yn=y+((1-k)*paso)
      ! esto mueve la particula
      x = xn
      y = yn
      ! esto es para respetar la frontera
      IF (xn>=50) x=50
      IF (xn<=-50) x=-50
      IF (yn>=50) y=50
      IF (yn<=-50) y=-50
      IF (x==0 .and. y ==0) THEN
        tiempo = tiempo + i
        retorno = retorno + 1
        EXIT 
      END IF
      IF (i==pasosmax-1) THEN
        noretorno = noretorno + 1
      END IF
    END DO
  END DO
  tprom = real(tiempo,4)/real(retorno,4)
  probretorn = real(retorno)/real(100000)
  PRINT*,'Probabilidad de retornar',probretorn
  PRINT*,'Tiempo de retorno promiedio',tprom
  PRINT*,noretorno,'no retornaron'

END PROGRAM caminos2d






















