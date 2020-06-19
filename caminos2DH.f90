! 2020 - 25 - 5
! caminos2DH.f90
! Félix Cabrera (walberto.cabrera@gmail.com)

! CAMINATAS ALEATORIAS EN UNA DIMENCION
! Malla hexagonal.

! Codificación del texto: UTF-8
! Compiladores probados: GNU Fortran (Ubuntu 9.2.1-9ubuntu2) 9.2.1 2019008

! Instrucciónes de compilación: no requiere nada más
! gfortran -Wall -pedantic -std=f95 caminos2DH.f90 -o caminos2DH
! ./caminos2DH

PROGRAM caminos2DH

  IMPLICIT NONE

  ! Declaramo variables principales
  INTEGER(4):: paso, pasosmax
  REAL(4):: x,y,ang,len
  ! Variables auxiliares
  REAL(4):: a,l
  INTEGER, DIMENSION (33):: sem
  INTEGER(4):: i,sem1
  ! Variable de control
  INTEGER(4):: err

  ! Abrimos el archivo de configuración (12)
  OPEN (10, FILE='parametros.config', STATUS='old', IOSTAT=err)
  IF (err .ne. 0) STOP 'parametros.config is missing'
  ! Leemos la configuración
  READ(10,*) sem1
  READ(10,*) pasosmax
  CLOSE(10)

  IF (sem1 /= 0) THEN
    ! Seleccionamos una semilla
    sem = sem1
    ! Ponemos la semilla
    CALL RANDOM_SEED (put=sem)
  END IF

  ! Abrimos archivo para guardar los resultados
  OPEN (12, FILE='Resultados.dat',STATUS='new', IOSTAT=err)
  IF (err .ne. 0) STOP 'Resultados.dat already exists'
  ! iniciamos las variables
  x = 0
  y = 0
  paso = 0

  DO i=1, pasosmax

    CALL RANDOM_NUMBER(a)
    CALL RANDOM_NUMBER(l)

    !esta parte escoje el angulo
    ang = 1.047197551*(INT(a*7))
    len = INT(10*l)
    x = x + len*COS(ang)
    y = y + len*SIN(ang)

    WRITE(12,*) i,x,y

    IF (x==0 .and. y==0) THEN
      PRINT *, 'Condicion de retorno alcanzada'
      EXIT
    END IF
  END DO

  CLOSE(12)

END PROGRAM caminos2DH
