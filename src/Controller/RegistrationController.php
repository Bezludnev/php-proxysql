<?php

namespace App\Controller;

use App\Entity\Message;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class RegistrationController extends AbstractController
{
    /**
     * @Route("/register", name="register")
     */
    public function register(Request $request, EntityManagerInterface $em, ValidatorInterface $validator): Response
    {
        if ($request->isMethod('POST')) {
            $message = new Message();
            $message->setContent($request->request->get('message'));

            $errors = $validator->validate($message);
            if (count($errors) > 0) {
                return $this->render('registration/index.html.twig', ['errors' => $errors]);
            }

            $em->persist($message);
            $em->flush();

            return $this->redirectToRoute('register');
        }

        return $this->render('registration/index.html.twig');
    }
}
