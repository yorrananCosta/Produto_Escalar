#include <stdio.h>

int main() {
    int escolha;
    do
    {

        mostrarOpcoes();
        scanf("%d", &escolha);
        switch (escolha)
        {
        case 1:
            /* code */
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            return 0;
            break;
        default:
            printf("Erro na seleção! Por favor, digite novamente.\n");
            break;
        }
    
    } while (escolha != 4);
    
}