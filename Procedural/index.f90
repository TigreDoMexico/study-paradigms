program paradigma_imperativo
implicit none
    integer :: i, valor, io
    integer :: arquivo = 1, novo_arquivo = 2
    integer :: totalSalarios = 0
    real, dimension(100) :: lista_salarios

    open(arquivo, file = 'lista_salarios.txt', status = 'old')

    do
        read(arquivo,*, IOSTAT = io) valor

        if(io /= 0) then
            exit
        else
            lista_salarios(totalSalarios + 1) = valor
        end if

        totalSalarios = totalSalarios + 1
    end do

    open(novo_arquivo, file = 'lista_atualizada.txt', status = 'old')

    do i = 1, totalSalarios, 1
        write(novo_arquivo, *) (lista_salarios(i) * 0.9)
    end do

    close(arquivo)
end program paradigma_imperativo
