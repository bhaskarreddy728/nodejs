const express = require("express");
const auth = require("../../middlewares/auth");
const ticketController = require("../../controllers/ticket.controller");
const validate = require("../../middlewares/validate");
const router = express.Router();
const ticketValidation = require("../../validations/ticket.validation");

router.get(
  "/searchDesignation",
  auth("getUsers"),
  ticketController.getSearchDesignation
);
router.patch(
  "/delete/:ticketId",
  auth("manageUsers"),
  validate(ticketValidation.deleteTicket),
  ticketController.deleteTicket
);
router.get(
  "/searchTicket",
  auth("getUsers"),
  ticketController.getSearchTickets
);
router.get("/dateRange", auth("getUsers"), ticketController.getDateRange);

router
  .route("/")
  .post(auth('manageUsers'), validate(ticketValidation.createTicket), ticketController.TicketCreate)
  // .post(ticketController.TicketCreate)

  .get(auth("getUsers"), ticketController.getAllTickets);

router
  .route("/:ticketId")
  .get(auth("getUsers"), validate(ticketValidation.getTicket), ticketController.getSingleTicket)
  .patch(auth("manageUsers"), validate(ticketValidation.updateTicket), ticketController.updateTicket)
  .delete(auth("manageUsers"), validate(ticketValidation.deleteTicket), ticketController.deleteTicket)

module.exports = router;

/**
 * @swagger
 * tags:
 *   name: Ticket
 *   description: Ticket management and retrieval
 */

/**
 * @swagger
 * /ticket:
 *   post:
 *     summary: Create a Ticket
 *     description: Admin can create a Ticket.
 *     tags: [Tickets]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - issueTitle
 *               - ticketCategory
 *               - ticketPriority
 *               - companyDetail
 *               - ticketDescription
 *               - ticketIssueImage
 *               - ticketIssueDoc
 *               - peopleId
 *               - ticketStatus
 *             properties:
 *               issueTitle:
 *                 type: string
 *               ticketCategory:
 *                 type: string
 *               ticketPriority:
 *                 type: string
 *               companyDetail:
 *                 type: string
 *               ticketDescription:
 *                 type: string
 *               ticketIssueImage:
 *                 type: string
 *               ticketIssueDoc:
 *                 type: string
 *               peopleId:
 *                 type: Integer
 *               ticketStatus:
 *                 type: string
 *             example:
 *               issueTitle: fake ticket title
 *               ticketCategory: It support
 *               ticketPriority: important
 *               companyDetail: fack name
 *               ticketDescription: text write based on ticket
 *               ticketIssueImage: image path name
 *               ticketIssueDoc: document path name
 *               peopleId: 1
 *               ticketStatus: InProgress
 *     responses:
 *       "201":
 *         description: Created
 *         content:
 *           application/json:
 *             schema:
 *                $ref: '#/components/schemas/Ticket'
 *       "400":
 *         $ref: '#/components/responses/DuplicateTicket'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *
 *   get:
 *     summary: Get all tickets
 *     description: Only admins can retrieve all tickets.
 *     tags: [Tickets]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: query
 *         name: name
 *         schema:
 *           type: string
 *         description: User name
 *
 */

/**
 * @swagger
 * /ticket/{ticketId}:
 *   get:
 *     summary: Get a ticket
 *     description: Logged in users can fetch only their own Ticket information. Only admins can fetch other tickets.
 *     tags: [Ticket]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: ticketId
 *         required: true
 *         schema:
 *           type: string
 *         description: Ticket Id
 *     responses:
 *       "200":
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *                $ref: '#/components/schemas/Ticket'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 *   patch:
 *     summary: Update a ticket
 *     description: Logged in tickets can only update their own information. Only admins can update other tickets.
 *     tags: [tickets]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: ticketId
 *         required: true
 *         schema:
 *           type: string
 *         description: Ticket Id
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *              type: object
 *             properties:
 *               issueTitle:
 *                 type: string
 *               ticketCategory:
 *                 type: string
 *               ticketPriority:
 *                 type: string
 *               companyDetail:
 *                 type: string
 *               ticketDescription:
 *                 type: string
 *               ticketIssueImage:
 *                 type: string
 *               ticketIssueDoc:
 *                 type: string
 *               peopleId:
 *                 type: Integer
 *               ticketStatus:
 *                 type: string
 *             example:
 *               issueTitle: fake ticket title
 *               ticketCategory: It support
 *               ticketPriority: important
 *               companyDetail: fack name
 *               ticketDescription: text write based on ticket
 *               ticketIssueImage: image path name
 *               ticketIssueDoc: document path name
 *               peopleId: 1
 *               ticketStatus: InProgress
 *     responses:
 *       "200":
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *                $ref: '#/components/schemas/Ticket'
 *       "400":
 *         $ref: '#/components/responses/DuplicateTicket'
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 *
 */

/**
 * @swagger
 * /ticket/delete/{ticketId}:
 *   delete:
 *     summary: Delete a user
 *     description: Logged in users can delete only themselves. Only admins can delete other users.
 *     tags: [Users]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: User id
 *     responses:
 *       "200":
 *         description: No content
 *       "401":
 *         $ref: '#/components/responses/Unauthorized'
 *       "403":
 *         $ref: '#/components/responses/Forbidden'
 *       "404":
 *         $ref: '#/components/responses/NotFound'
 */