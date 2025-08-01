// kernel.c
void kernel_main() {
    char* video_memory = (char*) 0xb8000;
    const char* message = "Bem-vindo ao ErnixOS!";
    
    for (int i = 0; message[i] != '\0'; i++) {
        video_memory[i * 2] = message[i];      // caractere
        video_memory[i * 2 + 1] = 0x07;        // atributo (cinza claro em fundo preto)
    }

    while (1); // loop infinito
}
