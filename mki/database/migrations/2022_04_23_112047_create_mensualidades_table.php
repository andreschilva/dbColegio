<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMensualidadesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mensualidades', function (Blueprint $table) {
            $table->integer('id', true);
            $table->date('fecha_vencimiento')->nullable();
            $table->integer('mes')->nullable();
            $table->decimal('monto', 10)->default(0);
            $table->integer('matricula_id')->nullable()->index('matriculas_id');
            $table->boolean('pagado')->default(false);
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
        Schema::dropIfExists('mensualidades');
    }
}
