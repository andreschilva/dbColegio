<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToPeriodosClasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('periodos_clases', function (Blueprint $table) {
            $table->foreign(['horario_id'], 'periodos_clases_ibfk_2')->references(['id'])->on('horarios')->onUpdate('CASCADE');
            $table->foreign(['grupo_materia_id'], 'periodos_clases_ibfk_1')->references(['id'])->on('grupos_materias')->onUpdate('CASCADE');
            $table->foreign(['hora_id'], 'periodos_clases_ibfk_3')->references(['id'])->on('horas')->onUpdate('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('periodos_clases', function (Blueprint $table) {
            $table->dropForeign('periodos_clases_ibfk_2');
            $table->dropForeign('periodos_clases_ibfk_1');
            $table->dropForeign('periodos_clases_ibfk_3');
        });
    }
}
