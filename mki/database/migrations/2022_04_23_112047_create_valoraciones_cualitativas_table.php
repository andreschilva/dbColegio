<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateValoracionesCualitativasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('valoraciones_cualitativas', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('valoracion', 300);
            $table->integer('matricula_id')->index('matricula_id');
            $table->integer('periodo_id')->index('periodo_id');
            $table->boolean('anulado')->default(false);
            $table->dateTime('created_at')->nullable();
            $table->dateTime('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('valoraciones_cualitativas');
    }
}
