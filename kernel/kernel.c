void kernel_main() {
    const char* msg = "Welcome to MyOS kernel!";
    char* vmem = (char*) 0xb8000;
    for (int i = 0; msg[i] != 0; ++i) {
        vmem[i * 2] = msg[i];
        vmem[i * 2 + 1] = 0x07;
    }

    while (1);
}
