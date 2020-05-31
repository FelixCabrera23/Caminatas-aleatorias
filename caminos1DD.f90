! 2020 - 25 - 5
! caminos1DD.f90
! Félix Cabrera (walberto.cabrera@gmail.com)

! CAMINATAS ALEATORIAS EN UNA DIMENCION
! PASO CONTINUO.

! Codificación del texto: UTF-8
! Compiladores probados: GNU Fortran (Ubuntu 9.2.1-9ubuntu2) 9.2.1 2019008

! Instrucciónes de compilación: no requiere nada más
! gfortran -Wall -pedantic -std=f95 caminos1DD.f90 -o caminos1DD
! ./caminos1DD

PROGRAM caminos

  IMPLICIT NONE
  
  ! Declaramos variables principales
  INTEGER(4):: posicion, paso, pasosmax
  ! Variables auxiliares
  REAL (4) :: x,a
  INTEGER, DIMENSION (33):: sem
  INTEGER(4):: i, sem1
  ! Variable de control
  INTEGER (4):: err
  
  
    ! Abrimos el archivo de configuración (12)
  OPEN (10, FILE='parametros.config', STATUS='old', IOSTAT=err)
  IF (err .ne. 0) STOP 'parametros.config is missing'
  
  ! Leemos la configuración 
  READ(10,*) sem1
  READ(10,*) pasosmax
  CLOSE(10)
  
  
  IF (sem(1) /= 0) THEN
    ! Seleccionamos una semilla
    sem = sem1
    ! Ponemos la semilla
    CALL RANDOM_SEED (put=sem)
  END IF
  
  ! Abrimos archivo para guardar los resultados
  OPEN (12, FILE='Resultados.dat',STATUS='new', IOSTAT=err)
  IF (err .ne. 0) STOP 'Resultados.dat already exists'
  ! iniciamos las variables
  posicion = 0
  paso = 0
  
  
  WRITE(12,*) '0',posicion
  
  DO i=1, pasosmax
  
    CALL RANDOM_NUMBER(x)
    CALL RANDOM_NUMBER(a)
    
    paso= (INT(x*10))*((-1)**(INT(a*2)))
    ! Esta parte mueve la particula
    posicion = posicion + paso
    WRITE(12,*) i,posicion
    

    
    IF (posicion==0) THEN
      PRINT *, 'Condicion de retorno alcanzada'
      EXIT 
    END IF
  END DO
  CLOSE (12)
END PROGRAM caminos






















