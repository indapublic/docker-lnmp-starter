<?php
/*
 * This document has been generated with
 * https://mlocati.github.io/php-cs-fixer-configurator/?version=2.14#configurator
 * you can change this configuration by importing this file.
 */

return PhpCsFixer\Config::create()
    ->setRules([
        '@Symfony' => true,
        '@PHP56Migration' => true,
        '@PHP70Migration' => true,
        '@PHP71Migration' => true,
        'array_syntax' => ['syntax' => 'short'],
        'blank_line_before_statement' => ['statements' => ['if', 'break', 'continue', 'declare', 'return', 'throw', 'try', 'yield']],
        'combine_consecutive_unsets' => true,
        'general_phpdoc_annotation_remove' => true,
        'heredoc_to_nowdoc' => true,
        'list_syntax' => ['syntax' => 'long'],
        'no_extra_blank_lines' => ['tokens' => ['break', 'continue', 'extra', 'return', 'throw', 'use', 'parenthesis_brace_block', 'square_brace_block', 'curly_brace_block']],
        'no_short_echo_tag' => true,
        'no_useless_else' => true,
        'no_useless_return' => true,
        'ordered_class_elements' => true,
        'ordered_imports' => true,
        'php_unit_test_class_requires_covers' => true,
        'phpdoc_add_missing_param_annotation' => true,
        'phpdoc_order' => true,
        'phpdoc_var_without_name' => false,
        'single_quote' => false,
        'binary_operator_spaces' => [
            'default' => 'align_single_space_minimal',
        ],
        'concat_space' => [
            'spacing' => 'one',
        ],
    ])
    ->setFinder(PhpCsFixer\Finder::create()
        ->in(__DIR__ .'/src')
        ->in(__DIR__ .'/tests')
    )
;
