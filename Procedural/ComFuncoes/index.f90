! AUTOR: DAVID TIGRE MORAES
! Programa atualiza uma lista de números baseado em outra lista

!! ======== EXECUCAO DO PROGRAMA ========= !!
program paradigma_procedural
    use salario

    implicit none

    integer :: total_de_salarios = 0
    real, dimension(100) :: lista_salarios

    call obter_salarios(lista_salarios, total_de_salarios, 'Files/lista_salarios.txt')
    call salvar_novos_salarios(lista_salarios, total_de_salarios, 'Files/lista_atualizada.txt')
end program paradigma_procedural
