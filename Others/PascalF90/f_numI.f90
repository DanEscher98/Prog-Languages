program integral
    implicit none
    real :: a, b, delta_x, x_i, s
    integer :: n, i
    real, parameter :: accuracy=0.0001
    intrinsic :: int

    print *, "Set a: "
    read *, a
    print *, "Set b: "
    read *, b
    n = int((b-a)/accuracy)
    delta_x = (b-a)/n
    s = 0
    do i=1, n
        x_i = a + (i-0.5)*delta_x
        s = s + f(x_i)*delta_x
    end do

    print *, "I[sin(x)] with"
    print *, "a = ", a
    print *, "b =", b
    print *, "is equal to: ", s

contains
    real function f(x)
        real :: x
        f = sin(x)
    end function f
end program integral