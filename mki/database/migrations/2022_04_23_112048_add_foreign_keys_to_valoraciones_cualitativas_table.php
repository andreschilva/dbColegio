<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToValoracionesCualitativasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('valoraciones_cualitativas', function (Blueprint $table) {
            $table->foreign(['periodo_id'], 'valoraciones_cualitativas_ibfk_2')->references(['id'])->on('periodos')->onUpdate('CASCADE');
            $table->foreign(['matricula_id'], 'valoraciones_cualitativas_ibfk_1')->references(['id'])->on('matriculas')->onUpdate('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('valoraciones_cualitativas', function (Blueprint $table) {
            $table->dropForeign('valoraciones_cualitativas_ibfk_2');
            $table->dropForeign('valoraciones_cualitativas_ibfk_1');
        });
    }
}
