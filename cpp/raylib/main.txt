#include "main.hpp"

using namespace std;

int main()
{
InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");

SetTargetFPS(60);           

    while (!WindowShouldClose())    
    {
        BeginDrawing();

            ClearBackground(BLACK);

        EndDrawing();
    }

CloseWindow();        

return 0;
}