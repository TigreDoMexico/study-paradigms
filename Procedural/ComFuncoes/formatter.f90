module formatter
    implicit none

    contains
    
    subroutine escrever_salario_arquivo(indice_arquivo, valor)
        implicit none
        integer :: indice_arquivo
        real :: valor
        character(len = 20) :: formato = '(F10.2)'
    
        if(valor <= 10) then
            formato = '(F4.2)'
        else if(valor <= 100) then
            formato = '(F5.2)'
        else if(valor <= 1000) then
            formato = '(F6.2)'
        else if(valor <= 10000) then
            formato = '(F7.2)'
        else if(valor <= 100000) then
            formato = '(F8.2)'
        else if(valor <= 1000000) then
            formato = '(F9.2)'
        end if
    
        write(indice_arquivo, formato) valor
    end subroutine escrever_salario_arquivo

end module formatter
