<?php

final class SuffixDecorator
{
    private string $suffix;

    public function __construct(string $suffix)
    {
        $this->suffix = $suffix;
    }

    public function __invoke(string $word): string
    {
        return $word . $this->suffix;
    }
}

final class SuffixDecoratorFactory
{
    public static function make(string $suffix): SuffixDecorator
    {
        return new SuffixDecorator($suffix);
    }
}

$add_ly = SuffixDecoratorFactory::make('ly');

print_r($add_ly('hopeless') . PHP_EOL);
print_r($add_ly('total') . PHP_EOL);

$add_less = SuffixDecoratorFactory::make('less');

print_r($add_less('fear') . PHP_EOL);
print_r($add_less('ruth') . PHP_EOL);
