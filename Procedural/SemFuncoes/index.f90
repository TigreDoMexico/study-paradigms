program paradigma_imperativo
!implicit none permite que se crie variaveis de qualquer nome de qualquer tipo
implicit none
    integer :: indice_arquivo = 1, indice_arquivo_resultado = 2
    integer :: i, io
    integer :: total_de_salarios = 0
    real :: valor, valor_calculado, soma_salarios = 0
    real, dimension(100) :: lista_salarios

    character(len = 20) :: nome_arquivo_base = 'lista_salarios.txt'
    character(len = 20) :: nome_arquivo_resultado = 'lista_atualizada.txt'

    open(indice_arquivo, file = nome_arquivo_base, status = 'old')

    do
        read(indice_arquivo, *, IOSTAT = io) valor

        if(io /= 0) then
            exit
        else
            lista_salarios(total_de_salarios + 1) = valor
        end if

        total_de_salarios = total_de_salarios + 1
    end do

    close(indice_arquivo)

    open(indice_arquivo_resultado, file = nome_arquivo_resultado, status = 'new')

    do i = 1, total_de_salarios, 1
        valor_calculado = lista_salarios(i) * 0.9

        write(indice_arquivo_resultado, '(F10.2)') valor_calculado
        soma_salarios = soma_salarios + valor_calculado
    end do

    write(indice_arquivo_resultado, *) 'Media do Valor'
    write(indice_arquivo_resultado, '(F10.2)') (soma_salarios / total_de_salarios)

    close(indice_arquivo_resultado)
end program paradigma_imperativo
