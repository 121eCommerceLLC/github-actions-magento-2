<?php

namespace PHP_CodeSniffer\Tokenizers;

class FILETYPE extends Tokenizer
{
    /**
     * @inheritDoc
     */
    protected function tokenize($string)
    {
        return [
            [
                "code" => T_STRING,
                "type" => 'T_STRING',
                // "content" => '',
            ],
        ];
    }

    /**
     * @inheritDoc
     */
    public function processAdditional()
    {
    }
}
