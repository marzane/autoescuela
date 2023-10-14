/*******************************************************************************
 BASE DE DATOS AUTOESCUELA
 ******************************************************************************/

/*
 Base de datos: autoescuelaBD
 Usuario: autoescuela
 contraseña: 22cdvABZYCAU
 */

/*******************************************************************************
 CREACION DE TABLAS
 ******************************************************************************/

drop database autoescuelabd;

create database autoescuelabd;

use autoescuelabd;

CREATE TABLE
    USUARIO(
        NOMBRE VARCHAR(50) NOT NULL,
        PASSWORD VARCHAR(30) NOT NULL,
        ID INT NOT NULL AUTO_INCREMENT,

PRIMARY KEY (ID) );

CREATE TABLE
    PREGUNTA(
        ENUNCIADO VARCHAR(500) NOT NULL,
        RESPUESTA1 VARCHAR(500) NOT NULL,
        RESPUESTA2 VARCHAR(500) NOT NULL,
        RESPUESTA3 VARCHAR(500) NOT NULL,
        RESPUESTACORRECTA INTEGER NOT NULL,
        IMAGEN VARCHAR(40),
        ID INT NOT NULL AUTO_INCREMENT,

PRIMARY KEY (ID) );

CREATE TABLE
    RESULTADOEXAMEN(
        FECHAHORA TIMESTAMP NOT NULL,
        USUARIO INT NOT NULL,
        ID INT NOT NULL AUTO_INCREMENT,

PRIMARY KEY (ID), 

FOREIGN KEY (USUARIO) REFERENCES USUARIO(ID) ON DELETE CASCADE );

CREATE TABLE
    RESULTADOPREGUNTA(
        EXAMEN INTEGER NOT NULL,
        PREGUNTA INTEGER NOT NULL,
        RESULTADO enum("acierto", "fallo") NOT NULL,
        PRIMARY KEY (EXAMEN, PREGUNTA),
        FOREIGN KEY (EXAMEN) REFERENCES RESULTADOEXAMEN(ID) ON DELETE CASCADE,
        FOREIGN KEY (PREGUNTA) REFERENCES PREGUNTA(ID) ON DELETE CASCADE
    );

/*******************************************************************************
 DATOS DE EJEMPLO
 ******************************************************************************/

/********************************************USUARIO**********************************************/

INSERT INTO
    USUARIO (NOMBRE, PASSWORD)
VALUES (
        'Manuel José Castro Damas',
        '123456'
    );

INSERT INTO
    USUARIO (NOMBRE, PASSWORD)
VALUES ('Raul Moya Reyes', '123456');

INSERT INTO
    USUARIO (NOMBRE, PASSWORD)
VALUES (
        'Agustín Ruiz Linares',
        '123456'
    );

INSERT INTO
    USUARIO (NOMBRE, PASSWORD)
VALUES (
        'Gabriel Fernández Moral',
        '123456'
    );

INSERT INTO
    USUARIO (NOMBRE, PASSWORD)
VALUES (
        'Alberto Téllez Aguallo',
        '123456'
    );

INSERT INTO
    USUARIO (NOMBRE, PASSWORD)
VALUES (
        'Juan Chica Estrella',
        '123456'
    );

INSERT INTO
    USUARIO (NOMBRE, PASSWORD)
VALUES (
        'Jose Ramón Ureña Ureña',
        '123456'
    );

/********************************************PREGUNTA**********************************************/

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En una vía fuera de poblado con arcén suficiente y transitable, ¿por qué parte de la vía circulará con un cuadriciclo ligero?',
        'Por el arcén derecho.',
        'Por el carril derecho de la calzada, sin invadir el arcén.',
        'Por el carril derecho de la calzada, aunque deberé desplazarme al arcén cuando obstaculice la marcha normal del resto de los vehículos.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Cuando en una intersección la preferencia de paso no está indicada por señal, ¿a qué vehículos se debe ceder el paso?',
        'A los vehículos que circulen por la vía transversal, sea cualquiera el lado por el que se aproximen.',
        'A los vehículos que se aproximen por la izquierda.',
        ' A los vehículos que se aproximen por la derecha.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Qué peligro indica esta señal?',
        'El paso de animales de montura.',
        'El paso de animales en libertad.',
        'El paso de animales domésticos.',
        2,
        'p1.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En poblado, ¿a qué velocidad máxima circulará conduciendo un ciclomotor de tres ruedas?',
        'A 40 kilómetros por hora.',
        'A 45 kilómetros por hora.',
        'A 50 kilómetros por hora.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'De noche, Ud. circula con su ciclomotor de tres ruedas por una vía interurbana suficientemente iluminada . Además de las luces de posición, ¿debe encender otra luz?',
        'Sí, las luces de cruce.',
        'Sí, las luces de cruce o de carretera, indistintamente.',
        'No, porque la vía está suficientemente iluminada.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Cuando Ud. encuentre esta señal en una intersección, ¿qué debe hacer?',
        'Detenerme, en todo caso.',
        'Detenerme sólo cuando sea preciso para ceder el paso.',
        'Circular con precaución, porque me indica la proximidad de un peligro indefinido.',
        2,
        'p2.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Como norma general, está prohibido hacer un cambio de sentido de la marcha en...',
        'las glorietas.',
        'los pasos a nivel.',
        'las calzadas de doble sentido de circulación.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Como norma general, ¿está permitido utilizar el teléfono móvil durante la conducción?',
        'Si.',
        'No.',
        '.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En una vía urbana de único sentido de circulación, ¿podrá estacionar su ciclomotor en el lado izquierdo de la calzada?',
        'Si.',
        'No.',
        '.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Antes de incorporarse a la circulación con su ciclomotor, Ud. debe comprobar ...',
        'que los demás vehículos se han detenido para dejarle pasar.',
        'que no obtaculiza la marcha de los demás vehículos a los que Ud. debe ceder el paso.',
        'que los vehículos que se aproximan van a cederle el paso.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿A qué vehículos prohíbe la entrada esta señal?',
        'A los ciclomotores y motocicletas.',
        'A todos los vehículos de motor.',
        'A las motocicletas.',
        3,
        'p3.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Debido a la intensidad de la circulación, Ud. se ve obligado a frenar bruscamente su ciclomotor. Si le es posible, ¿cómo advertirá esta circunstancia a los demás USUARIO si va a indicarlo con el brazo?',
        'Extendiéndolo horizontalmente con la palma de la mano extendida hacia abajo.',
        'Moviéndolo de arriba abajo con movimientos cortos y rápidos.',
        'Doblándolo hacia arriba con la palma de la mano extendida.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Esta señal ...',
        'indica peligro por la proximidad de una curva a la derecha.',
        'prohíbe cambiar de dirección a la derecha.',
        'indica la proximidad de un peligro indeterminado en la vía.',
        1,
        'p4.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Cuando Ud. vaya a girar con su ciclomotor para entrar en otra vía y haya peatones cruzando la calzada, ¿debe dejarles pasar?',
        'Sí, pero sólo si los peatones están cruzando por un paso debidamente señalizado.',
        'Sí, aunque no exista paso para peatones.',
        'No, porque tengo preferencia de paso.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Esta señal prohíbe ...',
        'girar a la izquierda.',
        'girar a la derecha.',
        'cambiar el sentido de la marcha.',
        3,
        'p5.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si Ud. circula conduciendo su ciclomotor de dos ruedas por una vía fuera de poblado, ¿qué distancia de seguridad debe dejar cuando adelante a otro vehículo mientras circula en forma paralela?',
        '1,50 metros, como mínimo.',
        '1,50 metros, como máximo.',
        'La que estime oportuna, siempre que no sea superior a 1 metro.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En un accidente de circulación, ¿qué debe hacer para auxiliar a un herido que está muy nervioso?',
        'Tranquilizarle con su presencia y sus palabras.',
        'Hacerle andar y darle agua.',
        'Darle algún tranquilizante, para que se serene.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La velocidad máxima fijada para los ciclomotores, ¿puede ser rebasada para adelantar?',
        'No, porque está prohibido.',
        'Sí, en 20 kilómetros por hora.',
        'Sí, siempre que no se superen los 60 kilómetros por hora.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Esta señal obliga a encender, al menos, ...',
        'la luz de cruce, sólo si es de noche.',
        'la luz de cruce, con independencia de las condiciones de visibilidad o iluminación de la vía.',
        'la luz de posición.',
        2,
        'p6.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Vd. circula con su ciclomotor de día pero, debido a una niebla muy densa, no existe visibilidad suficiente. ¿Debe encender las luces de su vehículo?',
        'Sí, las luces de posición y de cruce.',
        'No, porque sólo deben encenderse de noche.',
        'Sí, pero sólo si circulo por vías interurbanas.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si circula de noche con su turismo por una vía urbana insuficientemente iluminada, ¿qué luces debe encender?',
        'Las de posición y las de cruce.',
        'Las de posición y las de carretera, sustituyendo las de carretera por las de cruce.',
        'Las de posición y, las de cruce y carreteras, indistintamente.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Por la vía que se observa en la fotografía, Ud. no podrá circular con su turismo, sin causa justificada, a una velocidad inferior a...',
        '60 kilómetros por hora si entorpece la marcha de otros vehículos circulando',
        '60 kilómetros por hora, circulen o no otros vehículos.',
        '50 kilómetros por hora, circulen o no otros vehículos.',
        1,
        'p7.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si su turismo queda inmovilizado de día y con tiempo claro en el arcén de una autopista a causa de una avería, ¿debe encender alguna luz en su vehículo?',
        'Sí, las luces de posición, siempre.',
        'No.',
        'Sí, la señal de emergencia si el vehículo la lleva.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En esta intersección en la que no existe línea de detención pintada en la calzada, ¿dónde debe detenerse?',
        'Al lado de la señal, sin rebasarla.',
        'En la intersección, siempre que la posición de mi vehículo no modifique la trayectoria normal de los vehículos que circulen por la vía transversal.',
        'Inmediatamente antes de llegar a la intersección, es decir, en la unión de las dos vías.',
        3,
        'p8.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La maniobra de marcha atrás, en los casos en que, excepcionalmente, está permitida, ¿puede efectuarse en toda clase de vías?',
        'No, porque está absolutamente prohibida en autopistas y autovías.',
        'Sí.',
        'No, porque, sólo está permitida en vías dentro de poblado.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Con su turismo circula por un carril que ha sido habilitado para ser utilizado en sentido contrario al habitual, ¿le está permitido desplazarse al destinado al sentido normal de circulación para adelantar?',
        'No.',
        'Sí.',
        'Sí, pero solo para adelantar.',
        1,
        'p9.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En vías de dos sentidos y un carril para cada sentido, siempre que el conductor de un vehículo advierta que va a ser adelantado, debe...',
        'disminuir la velocidad.',
        'indicar con el indicador de dirección derecho, que permite el adelantamiento.',
        'ceñirse al borde derecho de la calzada.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Circula con su turismo a la velocidad mínima establecida para la autovía por una pendiente ascendente. Teniendo en cuenta la señal, ¿por qué carril debe circular? (los dos carriles de la izquierda con señal mínima de 70 kms/h.)',
        'Por el derecho, aunque si las circunstancias lo permiten podré circular por el central o por el izquierdo.',
        'Por el derecho, únicamente.',
        'Por el central o por el izquierdo, pero nunca por el derecho, que está reservado para el tráfico rápido.',
        2,
        'p10.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En una glorieta en la que no está regulada la preferencia de paso por señal, Ud. pretende acceder a ella, pero observa que, dentro de la vía circular, por su izquierda, circula otro vehículo, ¿debe cederle el paso?',
        'No, porque sólo debo ceder el paso a los vehículos que se aproximen por mi derecha.',
        'Sí, pero únicamente cuando se trate de vehículos automóviles.',
        'Sí, porque circula dentro de la vía circular.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Es correcta su posición en la calzada de acuerdo con las circunstancias que se observan en la fotografía?',
        'Sí, porque así dejo el carril de la derecha para los vehículos que vayan a entrar o salir de la autopista.',
        'Sí, porque en esta vía de varios carriles para el mismo sentido, se puede circular por el que se crea más conveniente.',
        'No, porque deberé circular por el carril de la derecha y sólo utilizaré los restantes cuando las circunstancias del tráfico o de la vía lo aconsejen.',
        3,
        'p11.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Conduce su turismo por una carretera convencional con un carril para cada sentido, sin arcén, y desea adelantar al turismo que circula a 90 kilómetros por hora delante de Ud., ¿a qué velocidad máxima puede adelantarlo?',
        'A 110 kilómetros por hora.',
        'No está permitido el adelantamiento porque el turismo que circula delante lo hace a la velocidad máxima permitida para este tipo de vías.',
        'A 120 kilómetros por hora.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En poblado, ¿a qué velocidad máxima le está permitido circular si conduce un conjunto formado por un turismo con remolque?',
        'A 50 kilómetros por hora.',
        'A 60 kilómetros por hora.',
        'A 40 kilómetros por hora.',
        1,
        'p12.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Es correcto colocar almohadas o cualquier otro objeto debajo de la cabeza de un herido?',
        'No, no se debe hacer.',
        'Sí, estará más cómodo.',
        'Es indiferente.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En el carril de la izquierda de la vía por la que Ud. circula, se ha encendido en el semáforo de carril un aspa roja, ¿qué deben hacer los vehículos que circulan por dicho carril?',
        'Abandonar el carril en el tiempo más breve posible.',
        'Cambiarse de carril antes de llegar a la altura del semáforo.',
        'Detenerse porque por ese carril no pueden circular.',
        1,
        'p13.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si circulando por una carretera, se encuentra con placas de hielo, conviene...',
        'celerar para salir lo más pronto posible del peligro.',
        'no frenar ni acelerar y conducir con suavidad.',
        'llevar el pedal del freno ligeramente presionado para que, en caso de necesidad, la frenada sea más rápida.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En zona urbana Ud. penetra en el paso inferior que se observa en la fotografía. A la vista de la señal circular de color azul, ¿debe encender alguna luz?',
        'Sí, las luces de posición para indicar mi presencia.',
        'Sí, las luces de posición y las de cruce, esté el paso inferior suficientemente o insuficientemente iluminado.',
        'Sí, las luces de posición y las de largo alcance o carretera si el paso inferior está insuficientemente iluminado.',
        2,
        'p14.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si Ud. se encuentra implicado en un accidente de circulación en el que haya resultado muerta alguna persona, deberá...',
        'retirar inmediatamente de la calzada a la víctima.',
        'evitar la modificación del estado de las cosas y de las huellas u otras pruebas para determinar la responsabilidad, salvo que con ello se perjudique la seguridad de los heridos o la circulación.',
        'no tocar, en ningún caso, a la víctima ni al resto de los heridos ni los vehículos hasta que llegue la autoridad.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'El vehículo blanco que se observa a la derecha de la fotografía está estacionado ocupando parte de la acera. ¿Es correcto?',
        'Sí, porque, de no ocupar parte de la acera, impediría el paso de otros vehículos.',
        'Sí, porque aunque el comportamiento no es correcto, deja espacio suficiente en la acera para que pasen los peatones.',
        'No, porque está utilizando parte de la vía reservada a los peatones.',
        3,
        'p15.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Ud. circula por un carril adicional que se ha habilitado por razones de fluidez. Como norma general, ¿qué obligaciones debe tener en cuenta?',
        'Que debo circular utilizando la luz de cruce tanto de día como de noche, al menos, y a una velocidad máximo de 80 kilómetros por hora y mínima de 60.',
        'Que por dicho carril sólo pueden circular turismos y motocicletas.',
        'Solamente que debo utilizar la luz de cruce tanto de día como de noche.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Cómo advertirá, fuera de poblado, al conductor del vehículo que circula delante que Ud. pretende adelantarlo?',
        'Con las señales acústicas, únicamente.',
        'Con las señales acústicas o las luminosas utilizando en forma intermitente.',
        'Con las señales luminosas, únicamente.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'De acuerdo con la señalización que se observa en la fotografía y que la línea amarilla es continua, ¿le está permitido parar o estacionar?',
        'Estacionar, no; parar, sí, debido a su corta duración.',
        'Sí, porque no se obstaculiza a otros vehículos ya que hay más carriles para circualar.',
        'No, tanto si está parado como estacionado.',
        3,
        'p16.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Ud. desea realizar la maniobra de cambio de dirección a la izquierda pero no existe visibilidad suficiente en la intersección. ¿Le está permitido realizar la maniobra?',
        'No.',
        'Sí.',
        'Sí, como norma general.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Cuando Ud. se acerca al paso a nivel que se observa en la fotografía, la barrera comienza a bajar para atravesarse en la calzada, ¿debe Ud. cruzar el paso a nivel?',
        'Sí, siempre que observe que no se aproxima ningún vehículo que circule sobre raíles.',
        'No, en ningún caso.',
        'Sí, teniendo la precaución de cruzar antes de que esté la barrera completamente bajada',
        2,
        'p17.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Para incorporarse a la circulación, ¿puede dar marcha atrás, si es necesario?',
        'Sí, es una de las maniobras en las que está permitido hacer marcha atrás.',
        'Sí, pero sólo en vías urbanas.',
        'No, en ningún caso. La marcha atrás está prohibida.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Cuando Ud. se prepare para adelantar al camión cisterna que se observa en la fotografía, de acuerdo con las señales que el mismo lleva, tendrá que tener en cuenta que es un vehículo que...',
        'tiene un peso máximo autorizado superior a 3.500 kilógramos.',
        'mide más de 2,50 metros de ancho.',
        'mide más de 12 metros.',
        3,
        'p18.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La fatiga que produce la conducción hace que, además de otros síntomas, disminuya...',
        'la capacidad de concentración y la seguridad.',
        'el tiempo de reacción.',
        ' la sensibilidad al deslumbramiento de noche.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En la baca de su turismo, ¿puede transportar otra carga que no sea equipaje?',
        'No, porque está prohibido.',
        'Sí, siempre que la carga no sobresalga de la estructura del vehículo.',
        'Sí, siempre que la carga sea adecuada a las características del vehículo, no comprometa su estabilidad y , en su caso, vaya correctamente señalizada.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'El vehículo que se observa en la fotografía lleva una señal de color naranja con reborde negro, compuesta por dos rectángulos y números en su interior, ¿qué significa?',
        'Que el vehículo transporta mercancía peligrosa determinadas por los números.',
        'Que el vehículo excede en masas y dimensiones.',
        'Que el vehículo lleva una matrícula europea.',
        1,
        'p19.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En el turismo que Ud. conduce, va a viajar como pasajero su hijo de ocho años, ¿le está permitido que lo haga en el asiento delantero del mismo?',
        'No, en ningún caso.',
        'No, salvo que utilice asientos de seguridad o dispositivos debidamente homologados para este fin.',
        'Sí, en todo caso.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La señal cuadrada de fondo azul que se observa en el centro de la fotografía le indica...',
        'que es una calzada sin salida en la que los vehículos sólo pueden salir por el lugar de entrada.',
        'el lugar donde está autorizado el estacionamiento de vehículos.',
        'un lugar reservado para el estacionamiento de taxis.',
        1,
        'p20.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Cuando en una vía de sentido único existe un refugio o isleta, ¿por qué parte de la calzada se debe circular?',
        'Por la parte de la calzada que queda a la derecha del refugio o isleta, únicamente.',
        'Por la parte de la calzada que queda a la izquierda del refugio o isleta, únicamente.',
        'Por cualquiera de los dos lados.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Teniendo en cuenta las características de la calzada que se observa en la fotografía y que la vía es de doble sentido de circulación, Ud. circulará con su turismo...',
        'por la derecha de la calzada sin sobrepasar los 80 kilómetros por hora.',
        'por el centro de la calzada cuando no se aproximen otros vehículos en sentido contrario, sin sobrepasar lo 70 kilómetros por hora.',
        'por la derecha de la calzada siempre, sin sobrepasar los 90 kilómetros por hora.',
        3,
        'p21.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'De noche, dentro de poblado, ¿está permitido utilizar la luz de largo alcance o carretera?',
        'Sí, pero unicamente cuando circule a más de 40 kilómetros por hora y la vía no esté iluminada.',
        'Sí, cuando la vía esté insuficientemente iluminada, siempre que observe que no hay posibilidad de producir deslumbramientos.',
        'No, dentro de poblado está prohibida su utilización.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'El turismo que se observa en el centro de la fotografía está estacionado en la zona marcada con franjas oblicuas paralelas enmarcadas por una línea continua. ¿Es correcto?',
        'No, porque está prohibido.',
        'Sí, porque es una zona excluidad al tráfico y ha encendido las luces de emergencia.',
        'Sí, porque es una zona especialmente destinada a este fin.',
        1,
        'p22.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Una luz roja en forma de aspa en un semáforo de carril, ¿qué indica a los conductores de vehículos que circulan por el carril sobre el que está situado?',
        'Que deben detenerse a la altura del semáforo.',
        'Que está prohibido ocupar dicho carril y deben abandonarlo lo antes posible.',
        'Que deben detenerse al llegar a un puesto de aduana, de policía, de peaje u otro.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'A la vista de la señal circular que se observa en la fotografía, ¿qué vehículo tendrá preferencia de paso si, en este tramo de vía, por su estrechez, es imposible el cruce de ambos vehículos?',
        'El turismo.',
        'El vehículo que tenga más facilidad de maniobrar.',
        'El camión.',
        3,
        'p23.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Ud. ha adelantado a otro turismo en una intersección regulada con un semáforo en verde. ¿Es correcto su comportamiento?',
        'Sí, porque en este caso tengo prioridad de paso en la intersección.',
        'No, porque en las intersecciones está prohibido adelantar siempre.',
        'No, porque sólo está permitido adelantar en las intersecciones con circulación giratoria o en las gloriestas.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La vía que se observa en la fotografía está tan saturada que los vehículos ocupan toda la anchura de la calzada. Si Ud. circula por el carril derecho y circula más rápido que los vehículos que circulan por los carriles más situados a la izquierda, ¿es correcto?',
        'No, porque está prohibido el adelantamiento por la derecha.',
        'Dentro de poblado, es correcto; fuera de poblado, no.',
        'Sí, porque, en este caso, el hecho de que los vehículos de un carril circulen más rápidamente que los de otro no se considera adelantamiento.',
        3,
        'p24.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Por trabajos en la calzada, se ha habilitado un carril para ser utilizado en sentido contrario al habitual. Si Ud. conduce un turismo que arrastra un remolque ligero, ¿puede circular por dicho carril?',
        'Sí, pero únicamente para realizar los adelantamientos precisos.',
        'Sí, salvo prohibición expresa en contrario.',
        'No, porque está prohibido.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'El vehículo que se observa en la fotografía se aproxima a una glorieta en la que no existe señal que regule la preferencia de paso. Por tanto, dicho vehículo debe ceder el paso a...',
        'los vehículos que se aproximen a la glorieta por la derecha.',
        'los vehículos que circulen dentro de la vía circular.',
        'los vehículos que se aproximen a la glorieta, cualquiera que sea el lado por el que se aproximen.',
        2,
        'p25.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si, dentro de poblado, circula conduciendo su turismo a 50 kilómetros por hora y entra en una zona señalizada como “Calle residencial, ¿debe modificar la velocidad?',
        'No, porque circulo dentro del límite máximo permitido en poblado.',
        'No, porque circulo a la velocidad máxima permitida para las zonas así señalizadas.',
        'Sí, deberá circular como máximo a 20 kilómetros por hora.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Le está permitido rebasar el límite de velocidad máximo expresado por las señales (110 k/h) que se observan en la fotografía para efectuar adelantamientos? ',
        'Sí, en 20 kilómetros por hora.',
        'No, en nigún caso.',
        'Sí, siempre que se circule antes de iniciar el adelantamiento, a la velocidad máxima permitida para la vía.',
        2,
        'p26.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Un herido en accidente de circulación que presenta parálisis y carece de sensibilidad en las piernas, probablemente padecerá...',
        'una fractura del hueso.',
        'un "estado de shock" (choque).',
        'una lesión de médula espinal.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Teniendo en cuenta la señal cuadrada que se observa a la derecha de la fotografía, no debe...',
        'cambiar el sentido de la marcha, porque se trata de una vía de un sólo sentido de circulación.',
        'desplazarse lateralmente a la derecha o a la izquierda.',
        'cambiar de dirección en la próxima intersección.',
        1,
        'p27.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En poblado, circula por una vía con dos carriles para cada sentido de circulación conduciendo su turismo por un tramo de vía en la que no está prohibido adelantar, ¿qué distancia de seguridad debe dejar entre su turismo y el vehículo que circula delante de Ud?',
        'Únicamente debo guardar un espacio libre que permita detener mi turismo en caso de frenado brusco del vehículo que circula delante sin colisionar con él.',
        '50 metros como mínimo.',
        'Un espacio libre que me permita detener mi turismo en caso de frenado brusco del vehículo que circula delante y, a su vez, permita al vehículo que me sigue adelantarme con seguridad.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Debido a un atasco, el vehículo blanco que se observa en la fotografía en primer término se ha quedado detenido en la intersección, impidiendo la circulación transversal, ¿cree Ud. que ha actuado correctamente el conductor al penetrar en la intersección?',
        'No, si preveía que podría quedar detenido.',
        'Sí, porque el semáforo encendido con luz verde le da prioridad de paso.',
        'Sólo si ha observado que no se aproxima ningún vehículo por la vía transversal.',
        1,
        'p28.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Un toque largo de silbato emitido por un Agente de la Circulación, ¿qué indica?',
        'Reanudación de la marcha.',
        'Detención obligatoria.',
        'Disminución de la velocidad.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La señal triangular que se observa a la derecha de la fotografía le advierte del peligro que supone la proximidad de una intersección en la que... ',
        'no tiene preferencia de paso y, por tanto, debe aplicar la norma general de prioridad en las intersecciones sin señalizar.',
        'tienen preferencia de paso los vehículos que se aproximen por la izquierda.',
        'tiene preferencia de paso sobre los vehículos que se aproximan po la izquierda.',
        3,
        'p29.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En un accidente de tráfico, un herido presenta una hemorragia externa. De las afirmaciones que a continuación se indican, ¿cuál es la correcta?',
        'La medida más prioritaria es evitar la infección de la herida.',
        'La actuación más eficaz es realizar presión directa sobre la herida.',
        'La actuación más eficaz es elevar la zona que sangra.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Un vehículo llevará encendida la luz de gálibo cuando mida...',
        'dos o más metros de ancho y seis o más metros de largo.',
        'más de 2,10 de ancho.',
        'más de cuatro metros de alto.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'A la vista de la señal de reglamentación, circular con borde rojo, ¿Le está permitido cambiar de dirección a la izquierda?',
        'Sí.',
        'No.',
        'Sí, cuando el semáforo pase a su fase roja.',
        2,
        'p30.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Al estacionar su vehículo observa que no deja espacio suficiente para el paso de otros vehículos, por lo que estaciona ocupando parte de la acera, ¿es correcto su comportamiento?',
        'No.',
        'Sí, siempre que no obstaculice el paso de los peatones por la acera.',
        'Sí, pero únicamente por la noche, que es cuando menos trásito de peatones hay.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Circula conduciendo su turismo detrás del vehículo que arrastra un remolque que se observa en la fotografía. Si Ud. desea adelantarlo, ¿le está permitido hacerlo por el carril derecho que está libre?',
        'Sí.',
        'No.',
        'Sí, como norma general.',
        2,
        'p31.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Le está permitido circular por una autovía, sin causa justificada, por debajo del límite mínimo de velocidad establecido para dicha vía?',
        'No, porque circulo a velocidad anormalmente reducida.',
        ' Sí, siempre que no circulen otros a los que pueda entorpecer su marcha normal.',
        'Sí, aunque en este caso estoy obligado a circular por el arcén, circulen o no otros vehículos.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Le está permitido desplazarse al carril izquierdo delimitado por conos?',
        'Sí, cuando por razones de emergencia, deba detener mi vehículo.',
        'No, porque los conos prohíbe el paso a través de la línea imaginaria que los une.',
        'Sí, para adelantar, siempre que al realizarlo no derribe ningún cono.',
        2,
        'p32.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Con niebla no espesa, ¿qué luces antiniebla le está permitido encender en su turismo?',
        'La posterior, únicamente.',
        'Ninguna.',
        'La delantera, únicamente.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En una calzada de doble sentido de circulación, circula conduciendo su turismo por un carril delimitado por marcas dobles discontinuas por ambos lados. Por tanto, Ud. sabe que circula por...',
        'un carril reservado a vehículos lentos.',
        'un carril reversible.',
        'un carril adicional.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'De qué peligro le advierten las señales que se observan en la fotografía?',
        'De posibles desprendimientos en la calzada.',
        'De la proximidad de una zona en la que sopla frecuentemente viento fuerte en dirección transversal.',
        'De la proximidad de un desnivel.',
        2,
        'p33.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si Ud. desea conducir un camión cuya masa máxima autorizada es de 3.500 kilogramos, ¿puede hacerlo con el permiso que le autoriza a conducir turismos?',
        'No, debo obtener otro permiso.',
        'Sí, pero tendré limitada la circulación a un radio de acción de 50 kilómetros.',
        'Sí.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Teniendo en cuenta la señal emitida por el Agente y la señal vertical que se observa a la derecha de la fotografía, Ud. debe...',
        'detenerse y, cuando el Agente le permita el paso, seguir obligatoriamente de frente.',
        'detenerse, únicamente si va a seguir la dirección que marca la flecha.',
        'girar a la derecha, porque está prohibido seguir de frente sin detenerse.',
        1,
        'p34.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Circulando durante la noche por vía interurbana insuficientemente iluminada, ¿está permitido la utilización simultánea de la luz de largo alcance o carretera y la de corto alcance si no hay posibilidad de deslumbrar a otros USUARIO de la vía pública?',
        'Sí.',
        'No.',
        'No, nunca.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Qué debe hacer Ud. ante la luz amarilla no intermitente del semáforo?',
        'Detenerme en todo caso en la próxima intersección.',
        'Detenerme a la altura del semáforo, si puedo hacerlo en condiciones de seguridad suficiente.',
        'Puedo pasar extremando la precaución',
        2,
        'p35.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si Ud. conduce su turismo por un carril habilitado para circular en sentido contrario al habitual, ¿qué velocidad máxima no debe rebasar si no hay señal que la limite?',
        '80 kilómetros por hora.',
        '70 kilómetros por hora.',
        '60 kilómetros por hora.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La señal triangular que se aprecia en la fotografía, ¿qué le indica?',
        'Peligro por la proximidad de una intersección en la que debo ceder el paso a los que vengan por la izquierda.',
        'Peligro por la proximidad de una intersección con una vía a la izquierda, cuyos USUARIO deben ceder el paso.',
        'Peligro por la proximidad de una intersección.',
        2,
        'p36.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si circula Ud. con su turismo a 120 kilómetros por hora por una autopista con dos carriles para cada sentido de circulación y se mantiene en el carril izquierdo, ¿actúa correctamente?',
        'Sí, porque el carril izquierdo está reservado a los vehículos que circulan más rápidamente.',
        'Sí, porque al circular a la velocidad máxima permitida, no puedo ser adelantado por lo que no obstaculizo a ningún otro vehículo.',
        'No, porque, como norma general, debo circular por el carril derecho.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Le obliga la limitación de velocidad impuesta por la señal de obras que se aprecia en la fotografía?',
        'Sí, en todo caso.',
        'Sí, pero sólo cuando haya obreros ',
        'No.',
        1,
        'p37.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si circula Ud. por una vía en la que la densidad de la circulación es tal que los vehículos ocupan toda la anchura de la calzada y sólo pueda circular a una velocidad que dependa de la de los que van delante en su carril, ¿le está permitido cambiar de carril?',
        'No, en ningún caso.',
        'Sí, para realizar cualquier maniobra que no sea la de adelantamiento.',
        'Sí, pero solamente para prepararme a girar a la derecha o a la izquierda, salir de la calzada o tomar determinada dirección.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Qué distancia de separación debe Ud. guardar, como mínimo, con el vehículo blanco que va delante, al que no tiene propósito de adelantar?',
        'La que me permita detenerme en caso de frenado brusco, sin colisionar con él.',
        'La que, además de permitir detenerme en caso de frenado brusco del vehículo que va delante sin colisionar con él, permita al que me siga adelantarme con seguridad.',
        'Cincuenta metros.',
        2,
        'p38.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Está Ud. obligado a moderar la velocidad al aproximarse a una intersección?',
        'Sí, en todo caso.',
        'Solamente si no tengo prioridad de paso.',
        'Sí, siempre que la intersección se encuentre dentro de poblado.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La señalización que se aprecia en la fotografía le advierte que a 150 metros...',
        'hay una incorporación a una autovía, y debo ceder el paso a los vehículos que circulen por ella.',
        'hay una incorporación a una autovía, señalizada con STOP, por lo que debo detenerme.',
        'finaliza la autovía y debo ceder el paso a los vehículos que circulen por la vía a la que me voy a incorporar.',
        1,
        'p39.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si conduce un turismo y advierte que otro vehículo que le sigue tiene el propósito de adelantarle, ¿está Ud. obligado a indicarle la posibilidad de hacerlo, extendiendo el brazo y moviéndolo de atrás adelante, con el dorso de la mano hacia atrás, o poniendo en funcionamiento el intermitente derecho?',
        'Sí, en todo caso.',
        'No, en ningún caso.',
        'Solamente si no puedo ceñirme por completo al borde derecho de la calzada y el adelantamiento puede hacerse con seguridad.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'De acuerdo con la señalización que se observa en la fotografía, ¿le está permitido realizar un cambio de dirección a la izquierda?',
        'Sí.',
        'No.',
        'Sí, como norma general.',
        2,
        'p40.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En caso de accidente de circulación, ¿debe darse de beber a los heridos graves?',
        'Sí, siempre que el herido presente quemaduras graves.',
        'No, en ningún caso.',
        'No, como norma general.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Qué le indican las señales de balizamiento que se aprecian en la fotografía?
',
        'Que la próxima curva es especialmente peligrosa.',
        'Que solamente es utilizable el carril derecho.',
        'Que debo tomar obligatoriamente la salida inmediata que está a la derecha.',
        2,
        'p41.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En caso de accidente, ¿quiénes están obligados a auxiliar o solicitar auxilio para las víctimas, colaborar para evitar mayores peligros o daños, restablecer la seguridad de la circulación y esclarecer los hechos?',
        'Solamente los conductores implicados en el accidente.',
        'Solamente los conductores implicados en el accidente y los que presencien o tengan conocimiento del accidente.',
        'Los conductores y personas implicadas en el accidente y los que presencien o tengan conocimiento del mismo.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Qué le indica la señal que aparece en la fotografía?',
        'Que a partir de 200 metros cesa de ser utilizable el carril izquierdo.',
        'Que durante 200 metros cesa de ser utilizable el carril izquierdo.',
        'Que a partir de 200 metros la calzada va a tener tres carriles.',
        1,
        'p42.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En el centro de una calzada de sentido único existe un refugio. ¿Por qué parte de la calzada podrá circular?',
        'Únicamente por la parte de la calzada que quede a la izquierda del refugio.',
        'Tanto por la derecha como por la izquierda del refugio.',
        'Únicamente por la parte de la calzada que quede a la derecha del refugio.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En la autopista que se observa en la fotografía, ¿le está permitido inmovilizar el vehículo que conduce si desea descansar?',
        'Sí, siempre que lo haga fuera de la calzada y de la parte transitable del arcén.',
        'No, excepto en los lugares habilitados al afecto.',
        'Sí.',
        2,
        'p43.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Además de las luces de posición, ¿con qué otras luces puede utilizarse simultáneamente la luz delantera de niebla?',
        'Solamente con la de corto alcance y la posterior de niebla.',
        'Con la de corto alcance, la de largo alcance y la posterior de niebla.',
        'Solamente con las de posición.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Cuando circula próximo a otro vehículo, tiene que contar con la zona de incertidumbre del mismo. ¿Por dónde se extiende esa zona?',
        'Por delante del vehículo, solamente.',
        'Por delante y por detrás del vehículo, solamente.',
        'Por delante, por detrás y lateralmente del vehículo.',
        3,
        'p44.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Es correcta la posición del vehículo que se observa en la fotografía?',
        'Sí, si está parado; no, si está estacionado.',
        'Sí, tanto si está parado como estacionado.',
        'No, tanto si está parado como estacionado.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'El tiempo de reacción de un conductor, ¿resulta afectado por la ingestión de alcohol?',
        'Sí, resulta disminuido.',
        ' Sí, resulta aumentado.',
        'No. El alcohol no afecta al tiempo de reacción.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'A partir de las dos señales verticales que se observan en la fotografía, ¿está permitido adelantar invadiendo la parte izquierda de la calzada?',
        'Sí.',
        'No.',
        'Sí, siempre.',
        2,
        'p45.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si Ud. circula por una carretera situada fuera de poblado, ¿le estaría permitido emplear señales acústicas para advertir al conductor de otro vehículo el propósito de adelantarlo?',
        'Sí.',
        'No.',
        'Sí, pero solo en la circulación nocturna.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Teniendo en cuenta la señalización, ¿podría Ud. efectuar un cambio de sentido de la marcha en la calzada que se observa en la fotografía?',
        'Sí.',
        'No.',
        'Sí, en todos los casos.',
        2,
        'p46.gif'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si circula Ud. por una calzada de doble sentido de circulación y tres carriles separados por líneas longitudinales discontinuas, ¿dónde deberá colocarse para efectuar un cambio de dirección a la izquierda?',
        'En el carril izquierdo.',
        'En el carril central.',
        'En el carril derecho.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La utilización de pinzas para retener el cinturón de seguridad...',
        'es conveniente, porque reduce la presión del cinturón sobre el pecho.',
        'es peligroso, porque reduce la eficacia del cinturón.',
        'es necesaria, como complemento del airbag, en los vehículos dotados del mismo.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'A partir de la señal, (Fin de velocidad mínima 70 k/h.) ¿a qué velocidad mínima puede Ud. circular sin causa justificada por esta autopista?',
        'A 70 kilómetros por hora.',
        'A 60 kilómetros por hora.',
        'No existe límite mínimo de velocidad.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La principal ventaja del sistema de freno ABS es que, en caso de frenado de emergencia,...',
        'reduce considerablemente la distancia de frenado con pavimento mojado.',
        'evita el bloqueo de las ruedas.',
        'elimina el desgaste de las superficies frenantes.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'El carril que está habilitado para circular en sentido contrario al habitual, ¿puede ser utilizado por los conductores de vehículos que circulan en sentido contrario por el carril normal para adelantar?',
        'Sí.',
        'No.',
        'Sí, cuando no exista peligro de colisión con los vehículos que lo utilicen.',
        2,
        'p47.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Conduciendo su turismo, llega a un lugar en el que no es posible marchar hacia adelante por lo que, a pesar de poder cambiar de dirección o de sentido de la marcha, Ud. opta por dar marcha atrás, ¿es correcto su comportamiento?',
        'No, porque puedo cambiar de dirección o de sentido de la marcha.',
        'Sí, siempre que no invada un cruce de vías y no recorra más de 15 metros en dicha marcha.',
        'Sí, aunque invada un cruce de vías o recorra más de 15 metros.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En esta vía fuera de poblado, ¿qué luces debe llevar encendidas en su turismo teniendo en cuenta las circunstancias que se observan en la fotografía, que está amaneciendo y no ha salido el sol?',
        'Las de cruce y las de posición.',
        'Ninguna, porque cuando está amaneciendo es como si fuera de día claro.',
        'Únicamente las de posición, porque, aunque no ha salido el sol, se ve bien.',
        1,
        'p48.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Dentro de poblado, circula conduciendo su turismo detrás de otro sin intención de adelantarlo. ¿Qué separación debe guardar entre su vehículo y el que circula delante?',
        'Un espacio que, en caso de frenado brusco del vehículo que circula delante, me permita detenerme sin colisionar con él',
        'Una sepación mínima de 50 metros.',
        'Una separación que permita al conductor del vehículo que me sigue adelantarme con seguridad.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Siempre que se incorpore a una autopista por un carril de aceleración, Ud. debe cerciorarse de que puede incorporarse sin peligro...',
        'al final del carril, deteniéndose incluso si fuera necesario.',
        'deteniéndose siempre al final del carril, para observar la posición, velocidad y trayectoria de los vehículos.',
        'al principio del carril, deteniéndose incluso si fuera necesario. A continuación, acelerará hasta alcanzar la velocidad adecuada al final del carril para incorporarse a la circulación de la calzada.',
        3,
        'p49.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si Ud. circula por una vía interurbana que tiene dos carriles para cada sentido y desea adelantar a otro turismo que circula a 80 kilómetros por hora, ¿a qué velocidad máxima le está permitido realizar la maniobra?.',
        'A 100 kilómetros por hora.',
        'A 140 kilómetros por hora.',
        'A 120 kilómetros por hora.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En el túnel suficientemente iluminado de la fotografía, ¿es necesario encender alguna luz en su turismo?',
        'Sí, debo encender las de posición y las de cruce.',
        'No, porque con la iluminación de la vía es suficiente.',
        'Sí, sólo las de posición, para advertir mi presencia a los demás USUARIO.',
        1,
        'p50.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Le está permitido invadir un carril reservado para autobuses para adelantar?',
        'No, porque está prohibido.',
        'Sólo si la línea longitudinal del lado exterior del carril reservado para autobuses es discontinua.',
        'No, porque el adelantamiento por la derecha está prohibido.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Al entrar en el poblado que se observa en la fotografía, Ud. circulará conduciendo su turismo a...',
        ' 50 kilómetros por hora, como máximo.',
        'la velocidad mínima establecida para la vía interurbana.',
        '60 kilímetros por hora, como máximo.',
        1,
        'p51.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Le está permitido iniciar la maniobra de adelantamiento si observa que el conductor del vehículo al que pretende adelantar señaliza su propósito de desplazarse hacia ese mismo lado?
',
        'Sí, en todo caso, porque tengo preferencia.',
        'No, en ningún caso.',
        'Sí, cuando después de un tiempo prudencial su conductor no inicie la maniobra y después de advertirle con las señales ópticas y acústicas.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Debe ceder el paso al tractor que se aproxima por su derecha por un camino de tierra?',
        'Sólo si las circunstancias lo permiten.',
        'No, porque yo circulo por una vía pavimentada y tengo preferencia de paso.',
        'Sí, porque al no existir ninguna señal que regule la preferencia de paso, debo aplicar la norma general de prioridad de la derecha.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si Ud. circula conduciendo su turismo por un carril habilitado para ser utilizado en sentido contrario al habitual, ¿le está permitido invadir el carril o carriles destinados al sentido normal de circulación?',
        'No, ni siquiera para adelantar.',
        'Sí, para adelantar o cambiar el sentido de la marcha.',
        'Sí, siempre que no se alteren los elementos de balizamiento con los que está señalizado dicho carril.',
        1,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si Ud. conduce un turismo con remolque por la vía de doble sentido de circulación y arcén de menos de 1,50 metros de ancho que se observa en la fotografía, ¿qué velocidad máxima no debe rebasar?',
        '70 kilómetros por hora.',
        '80 kilómetros por hora.',
        '90 kilómetros por hora.',
        1,
        'p52.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'El conductor del vehículo que circula delante del suyo extiende el brazo moviéndolo de arriba abajo con movimientos cortos y rápidos. ¿Qué le indica?
',
        'Que va a desplazarse al carril izquierdo.',
        'Que va a frenar su marcha de modo considerable.',
        'Que circula en situación de emergencia.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Qué indica la señal triangular situada a la derecha de la fotografía?',
        'Peligro por existencia de un tramo de vía con fuerte pendiente descendente.',
        'Peligro por la existencia de un tramo de vía con fuerte pendiente ascendente.',
        'Peligro por la proximidad de una zona con desprendimientos frecuentes y la consiguiente posible presencia de obstáculos en la calzada.',
        1,
        'p53.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si en el centro de la calzada de sentido único por la que Ud. circula hay una isleta para canalizar el tráfico, ¿por qué parte de la calzada debe circular?',
        'Siempre por la parte de la calzada que quede a la izquierda de la isleta.',
        'Siempre por la parte de la calzada que quede a la derecha de la isleta.',
        'Por cualquier de los dos lados.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'A la vista de la señalización existente en la vía, fuera de poblado, de la fotografía, ¿le está permitido cambiar de dirección?',
        'No.',
        'Sí.',
        'La señal recomienda no realizar cambio de dirección.',
        2,
        'p54.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si un herido en accidente de circulación presenta dolor y deformidad en una extremidad, probablemente sufre...',
        'una hemorragia interna.',
        'parálisis.',
        'una fractura.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La marca discontinua que se observa a la derecha de la fotografía es más ancha que en el caso general. ¿Qué indica?
',
        'La proximidad de una línea continua.',
        'La existencia de un carril especial.',
        'Un carril destinado a la parada y estacionamiento de vehículos.',
        2,
        'p55.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Al llegar a una intersección encuentra a su derecha una señal de STOP y un semáforo encendido con la luz amarilla intermitente. ¿Qué debe hacer?',
        'Circular con precaución y detenerme sólo si tengo que ceder el paso a los vehículos que circulen por la vía transversal.',
        'Pasar con precaución porque la luz amarilla intermitente del semáforo exime de cumplir la señal vertical.',
        'Detenerme siempre y ceder el paso a los vehículos de la vía transversal.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En caso de quemadura, ¿es conveniente quitar la ropa adherida a la piel de la zona quemada?',
        'Sí, para evitar infecciones.',
        'Sólo si el herido está consciente.',
        'No, en ningún caso.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La señal cuadrada que se observa en la fotografía le indica que, a 400 metros del lugar donde está situada, Ud. encontrará...',
        'una salida a través de la cual se puede efectuar un cambio de sentido a distinto nivel.',
        'un lugar donde podrá hacer un cambio de dirección a la izquierda.',
        'una incorporación al la autopista.',
        1,
        'p56.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Si Ud. circula conduciendo su turismo fuera de poblado, ¿a qué velocidad como máximo le está permitido circular por un carril adicional que se ha habilitado por motivos de fluidez de la circulación?',
        'A aquélla a la que, como máximo, esté permitido circular por la vía en la que esté instalado.',
        'A 80 kilómetros por hora.',
        'A 90 kilómetros por hora, ya que estos carriles se instalan en vías de doble sentido de circulación con un carril para cada sentido.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Ud. ha detenido su turismo antes de llegar a la señal horizontal de STOP, ¿es correcto?',
        'Sí, porque no puedo rebasar el símbolo STOP marcado sobre la calzada.',
        'Sólo si desde ese lugar tengo suficiente visibilidad.',
        'No, porque debo detenerme ante la línea transversal continua, sin rebasarla.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Ud. ha efectuado con su vehículo una maniobra de parada fuera de poblado, ¿está permitido mantener encendida la luz de carretera?',
        'Sólo si paro en vías insuficientemente iluminadas.',
        'Sí, siempre que observe que no se van a producir deslumbramientos.',
        'No, porque está prohibido.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        '¿Le está permitido hacer un cambio de sentido de la marcha en la glorieta que se observa en la fotografía?',
        'No, salvo que una señal me lo autorice expresamente.',
        'Sí, siguiendo la dirección y sentido de las flechas de la señal circular.',
        'No, porque es una intersección.',
        2,
        'p57.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Dentro de poblado, Ud. se ve obligado a realizar con su turismo un servicio de los reservados a los vehículos prioritarios. ¿Debe utilizar las advertencias acústicas para advertir a los demás USUARIO esta especial situación?',
        'No, porque su utilización está prohibida en poblado.',
        'Sí.',
        'Sólo si mi vehículo no dispone de luz de emergencia.',
        2,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'En su turismo, con capacidad para cinco plazas, incluida la del conductor, ¿le está permitido transportar más personas adultas que plazas autorizadas tenga el vehículo?',
        'Sí, siempre que no se supere la masa máxima autorizada del turismo.',
        'Sí, siempre que vayan sentadas y no dificulten por detrás la visión del conductor.',
        'No.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'La señal le indica que...',
        'está prohibido circular sin mantener con el vehículo precedente una separación igual o mayor a la indicada en la señal, excepto para adelantar.',
        'está prohibido circular sin mantener con el vehículo precedente una separación igual o mayor a la indicada en la señal.',
        'está prohibido circular sin mantener con el vehículo precedente una separación mayor a la indicada en la señal.',
        1,
        'p57.jpg'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Ud. circula por un carril destinado al sentido normal de circulación contiguo a uno que se ha habilitado en sentido contrario al habitual. Si ha quedado un solo carril en su sentido de circulación, ¿qué debe hacer?',
        'Nada, porque circulo por la parte de la calzada a mi sentido destinada.',
        'Circular con la luz de cruce encendida, al menos y a una velocidad no inferior a la máxima permitida para la vía.',
        'Circular con la luz de cruce encendida, al menos y a una velocidad no inferior a 60 kilómetros por hora ni superior a 80 kilómetros por hora o inferiores si así estuviera establecido o específicamente señalizado.',
        3,
        'no_image.png'
    );

INSERT INTO
    PREGUNTA (
        ENUNCIADO,
        RESPUESTA1,
        RESPUESTA2,
        RESPUESTA3,
        RESPUESTACORRECTA,
        IMAGEN
    )
VALUES (
        'Con tiempo frío, la calzada puede estar helada y deslizante, pero ¿sabe Ud. qué zonas de la calzada son especialmente propensas al hielo?',
        'Los túneles.',
        'Los lugares sombríos y húmedos.',
        'Los tramos de vía rectos y cambios de rasante.',
        2,
        'no_image.png'
    );

/********************************************RESULTADOEXAMEN**********************************************/

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 84,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 53,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 8,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 33,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 124,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 6,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 126,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 58,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 51,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 139,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 61,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 66,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 38,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 112,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 49,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 98,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 111,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 93,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 32,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 134,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 37,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 41,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 47,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 85,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 79,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 25,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 54,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 36,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 119,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (1, 115,  "fallo");

--

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 2);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 84,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 53,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 8,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 33,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 124,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 6,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 126,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 58,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 51,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 139,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 61,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 66,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 38,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 112,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 49,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 98,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 111,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 93,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 32,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 134,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 37,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 41,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 47,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 85,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 79,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 25,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 54,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 36,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 55,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (2, 115,  "fallo");

--

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 2);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 84,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 53,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 8,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 33,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 124,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 6,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 126,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 58,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 51,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 139,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 61,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 66,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 38,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 113,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 49,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 98,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 111,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 93,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 34,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 134,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 37,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 41,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 47,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 57,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 79,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 25,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 54,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 36,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 55,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (3, 56,  "fallo");

--

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 2);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 77,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 54,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 60,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 58,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 63,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 52,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 76,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 53,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 69,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 70,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 64,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 78,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 68,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 65,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 71,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 67,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 56,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 66,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 51, 2);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 72,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 79,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 74,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 75,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 59,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 62,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 55,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 73,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 61,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 57,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (4, 80,  "acierto");

--

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 2);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 77,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 54,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 60,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 58,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 63,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 52,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 76,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 53,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 69,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 70,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 64,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 78,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 68,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 65,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 71,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 67,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 56,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 66,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 51, 2);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 72,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 79,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 74,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 75,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 59,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 62,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 55,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 73,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 61,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 57,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (5, 80,  "acierto");

--

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 2);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 1,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 2,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 3,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 4,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 5,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 6,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 7,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 8,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 9,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 10,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 11,  "acierto");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 12,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 13,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 14,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 15,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 16,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 17,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 18,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 19, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 20,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 21,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 22,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 23,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 24,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 25,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 26,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 27,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 28,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 29,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (6, 30,  "fallo");

--

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 1,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 2,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 3,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 4,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 5,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 6,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 7,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 8,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 9,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 10,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 11,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 12,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 13,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 14,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 15,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 16,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 17,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 18,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 19, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 20,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 21,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 22,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 23,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 24,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 25,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 26,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 27,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 28,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 29,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (7, 30,  "fallo");

 --

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 1,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 2,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 3,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 4,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 5,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 6,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 7,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 8,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 9,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 10,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 11,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 12,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 13,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 14,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 15,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 16,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 17,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 18,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 19, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 20,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 21,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 22,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 23,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 24,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 25,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 26,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 27,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 28,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 29,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (8, 30,  "fallo");

--

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 1,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 2,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 3,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 4,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 5,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 6,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 7,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 8,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 9,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 10,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 11,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 12,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 13,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 14,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 15,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 16,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 17,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 18,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 19, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 20,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 21,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 22,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 23,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 24,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 25,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 26,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 27,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 28,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 29,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (9, 30,  "fallo");

 --

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 3);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 1,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 2,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 3,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 4,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 5,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 6,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 7,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 8,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 9,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 10,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 11,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 12,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 13,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 14,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 15,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 16,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 17,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 18,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 19, 2);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 20,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 21,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 22,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 23,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 24,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 25,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 26,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 27,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 28,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 29,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (10, 30,  "fallo");

 --

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 3);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 1,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 2,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 3,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 4,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 5,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 6,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 7,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 8,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 9,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 10,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 11,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 12,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 13,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 14,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 15,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 16,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 17,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 18,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 19, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 20,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 21,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 22,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 23,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 24,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 25,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 26,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 27,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 28,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 29,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (11, 30,  "fallo");

 --

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 3);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 1,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 2,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 3,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 4,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 5,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 6,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 7,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 8,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 9,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 10,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 11,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 12,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 13,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 14,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 15,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 16,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 17,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 18,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 19, 2);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 20,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 21,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 22,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 23,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 24,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 25,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 26,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 27,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 28,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 29,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (12, 30,  "fallo");

--

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 3);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 31,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 32,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 33,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 34,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 35,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 36,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 37,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 38,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 39,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 10,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 11,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 12,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 13,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 14,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 15,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 16,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 17,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 18,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 19, 2);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 20,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 21,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 22,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 23,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 24,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 25,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 26,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 27,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 28,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 29,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (13, 30,  "fallo");

--

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 3);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 31,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 32,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 33,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 34,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 35,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 36,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 37,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 38,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 39,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 10,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 11,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 12,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 13,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 14,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 15,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 16,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 17,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 18,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 19, 2);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 20,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 21,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 22,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 23,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 24,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 25,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 26,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 27,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 28,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 29,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (14, 30,  "fallo");

--

INSERT INTO
    RESULTADOEXAMEN (FECHAHORA, USUARIO)
VALUES (CURRENT_TIMESTAMP, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 31,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 32,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 33,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 34,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 35,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 36,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 37,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 38,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 39,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 10,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 11,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 12,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 13,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 14,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 15,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 16,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 17,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 18,  "fallo");

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 19, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 20, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 21, 1);

INSERT INTO
    RESULTADOPREGUNTA (EXAMEN, PREGUNTA, RESULTADO)
VALUES (15, 22, 1);
