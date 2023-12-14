program harvest
    implicit none

    type :: t_test
        character(len=1) :: seed
        integer          :: water
        integer          :: fert
        integer          :: temp
    end type

    type(t_test), dimension(4) :: test_data

    test_data = [ t_test("@", 3, 3, 25), t_test("#", 1, 5, 30), t_test("&", 5, 1, 20), t_test("*", 3, 3, 15) ]

    call run_tests(test_data)

    contains

    subroutine run_tests(tests)
        type(t_test), dimension(:), intent(in) :: tests

        character(:), allocatable :: result
        integer :: index

        do index = 1, size(tests)
            result = ""
            call run_test(tests(index), result)
            print *, result
        end do
    end subroutine run_tests

    subroutine run_test(test, result)
        type(t_test),              intent(in)  :: test
        character(:), allocatable, intent(out) :: result

        call plant(test%seed, test%water, test%fert, test%temp, result)
    end subroutine run_test

    subroutine plant (seed, water, fert, temp, resultedPlant)
        character(len=1), intent(in) :: seed
        integer         , intent(in) :: water
        integer         , intent(in) :: fert
        integer         , intent(in) :: temp

        character(:), allocatable, intent(out) :: resultedPlant

        character(len=fert), allocatable  :: cluster
        character(len=water), allocatable :: stem
        character(:), allocatable         :: segment
        character(len=1)                  :: tip
        integer :: index

        cluster = ""
        stem    = ""
        tip     = ""

        do index = 1, fert
            cluster = trim(cluster) // seed
        end do

        do index = 1, water
            stem = trim(stem) // "-"
        end do

        if ((temp > 30).or.(temp < 20)) then
            segment = stem
            tip     = seed
        else
            segment = stem // cluster
        end if

        resultedPlant = ""
        do index = 1, water
           resultedPlant = resultedPlant // segment
        end do

        resultedPlant = resultedPlant // trim(tip)
    end subroutine plant

end program harvest
