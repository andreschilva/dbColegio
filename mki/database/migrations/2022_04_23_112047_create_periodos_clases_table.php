<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePeriodosClasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('periodos_clases', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('nombre', 15);
            $table->integer('grupo_materia_id')->index('grupo_materia_id');
            $table->integer('horario_id')->index('horario_id');
            $table->integer('hora_id')->index('hora_id');
            $table->boolean('eliminado')->default(false);
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
        Schema::dropIfExists('periodos_clases');
    }
}
