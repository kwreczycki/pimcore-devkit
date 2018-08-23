<?php

declare(strict_types=1);

use PHPUnit\Framework\TestCase;

final class FirstTest extends TestCase
{
    public function testTest1(): void
    {
        $this->assertEquals('123', '123');
        $this->assertNotEquals('123', '456');
        $this->assertTrue(true);
        $this->assertFalse(false);
    }

    public function testTest2(): void
    {
        $image = new \Pimcore\Model\Asset\Image();
        $this->assertInstanceOf(\Pimcore\Model\Asset\Image::class, $image);
        $this->assertNotInstanceOf(\Pimcore\Model\Asset\Text::class, $image);
    }

    public function testTest3(): void
    {
        $list = new \Pimcore\Model\DataObject\Classificationstore\StoreConfig\Listing();
        $list->load();
        foreach ($list->getList() as $item) {
            $this->assertInstanceOf(\Pimcore\Model\DataObject\Classificationstore\StoreConfig::class, $item);
        }
    }
}
