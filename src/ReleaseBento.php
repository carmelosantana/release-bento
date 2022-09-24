<?php

declare(strict_types=1);

namespace CarmeloSantana\ReleaseBento;

class ReleaseBento
{
    public static function execute(): void
    {
        echo shell_exec('bash .Bento.sh');
    }
}
