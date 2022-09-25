<?php

declare(strict_types=1);

namespace CarmeloSantana\ReleaseBento;

use Symfony\Component\Process\Process;

class Package
{
    public static function build(): void
    {
        $command = [
            'bash',
            dirname(__DIR__) . '/bin/Bento.sh',
        ];

        self::exec($command);
    }

    public static function exec(array $command): void
    {
        $process = new Process($command);
        $process->setTty(true);
        $process->run();
    }
}
